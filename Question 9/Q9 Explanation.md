<h1>Answer 9 Explanation</h1>

First, we included the required headers such as unistd.h and sys/wait.h.

Then we created multiple child processes using the following code:

<code>for (i = 0; i < 3; i++) {
    pid = fork();</code>

This loop creates 3 child processes. Each fork() call returns 0 to child and child PID to parent.

<code>if (pid == 0) {
    printf("Child process PID: %d\n", getpid());
    exit(0);
}</code>

Child terminates quickly, and if parent doesn't call wait(), zombie is created.

<code>while ((pid = wait(NULL)) > 0) {
    printf("Parent cleaned child PID: %d\n", pid);
}</code>

This part of the code is where the zombie prevention happens. The code <code>wait(NULL)</code> blocks the process until a child terminates and then returns the PID of cleaned child, and this loop continues until no child remains. In the end, no zombie processes remain.

In summary, the parent process prevents zombie processes by calling <code>wait()</code> to collect the termination status of each child.

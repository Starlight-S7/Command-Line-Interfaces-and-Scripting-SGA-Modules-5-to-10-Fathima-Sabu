<h1>Answer 10 Explanation</h1>

First, we included the required headers like unistd.h, signal.h, stdlib.h, and stdio.h

1 <code>void handle_sigterm(int sig) {
    printf("\nReceived SIGTERM. Performing cleanup...\n");
}</code>

This handles the SIGTERM, does not exit, and stimulates cleanup work.

2 <code>void handle_sigint(int sig) {
    printf("\nReceived SIGINT. Exiting gracefully...\n");
    exit(0);
}</code>

This code handles SIGINT, prints message, and then exits parent process gracefully.

3 <code>signal(SIGTERM, handle_sigterm);
signal(SIGINT, handle_sigint);</code>

If SIGTERM arrives, handle_sigterm is called, and if SIGINT arrives, handle_sigint is called. Without signal handlers, default behaviour will kill the process immediately.

4 <code>pid1 = fork();
if (pid1 == 0) {
    sleep(5);
    kill(getppid(), SIGTERM);
    exit(0);
}</code>

This is the first child. The things happening in this code are that it waits 5 seconds, gets parent PID, and send SIGTERM to parent.

5 <code>pid2 = fork();
if (pid2 == 0) {
    sleep(10);
    kill(getppid(), SIGINT);
    exit(0);
}</code>

This is the second child. It waits 10 seconds, sends SIGINT, and then the parent exits gracefully.

6 <code>while (1) {
    pause();
}</code>

Here, pause() suspends the parent, and wakes up only when a signal arrives. This keeps it efficient without no unwanted loop.

In summary, this program demonstrates signal handling where the parent process catches SIGTERM and SIGINT sent by child processes and responds differently before exiting gracefully.

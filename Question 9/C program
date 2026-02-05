#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>

int main() {
    int i;
    pid_t pid;

    for (i = 0; i < 3; i++) {
        pid = fork();

        if (pid == 0) {
            // Child process
            printf("Child process PID: %d\n", getpid());
            exit(0);
        }
    }

    // Parent cleans up all child processes
    while ((pid = wait(NULL)) > 0) {
        printf("Parent cleaned child PID: %d\n", pid);
    }

    return 0;
}

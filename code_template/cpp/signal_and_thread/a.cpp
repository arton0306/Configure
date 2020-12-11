/*
 * ref 1: https://devarea.com/linux-handling-signals-in-a-multithreaded-application/#.X9LwOKozb1K
 * ref 2: https://stackoverflow.com/questions/21091000/how-to-get-thread-id-of-a-pthread-in-linux-c-program
 */
#include <stdio.h>
#include <unistd.h>
#include <pthread.h>
#include <sys/mman.h>
#include <stdlib.h>
#include <sys/prctl.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <sys/syscall.h>
#include <cassert>
 
void *threadfn1(void *p)
{
    while(1){
        printf("thread1 %d\n", syscall(__NR_gettid));
        sleep(2);
    }
    return 0;
}
 
void *threadfn2(void *p)
{
    while(1){
        printf("thread2 %d\n", syscall(__NR_gettid));
        sleep(2);
    }
    return 0;
}
 
void *threadfn3(void *p)
{
    while(1){
        printf("thread3 %d\n", syscall(__NR_gettid));
        sleep(2);
    }
    return 0;
}
 
 
void handler(int signo, siginfo_t *info, void *extra) 
{
    int i;
    for(i=0;i<10;i++)
    {
        int tid = syscall(__NR_gettid);
        printf("in signal handler, %d\n", tid);
        sleep(2);
    }
}
 
void set_sig_handler(void)
{
    struct sigaction action;

    action.sa_flags = SA_SIGINFO; 
    action.sa_sigaction = handler;

    if (sigaction(SIGRTMIN + 3, &action, NULL) == -1) { 
        perror("sigusr: sigaction");
        _exit(1);
    }
}
 
int main()
{
    assert(sizeof(pid_t) == 4);

    pthread_t t1,t2,t3;
    set_sig_handler();
    pthread_create(&t1,NULL,threadfn1,NULL);
    pthread_create(&t2,NULL,threadfn2,NULL);
    pthread_create(&t3,NULL,threadfn3,NULL);
    pthread_exit(NULL);
    return 0;
}

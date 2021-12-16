#include <stdio.h>
#include <unistd.h>
#include <stdlib.h> 

int main(){
	pid_t pid;
	pid=fork();
	if(pid==0){
		int fibo[1000];
		fibo[0]=0;
		fibo[1]=1;
		int i;
		for(i=2;i<1000;i++){
			fibo[i]=fibo[i-1]+fibo[i-2];
			if(fibo[i]%2==0 && fibo[i]<=1000000 && fibo[i]>0){
				printf("child pid %d %d\n",getpid(),fibo[i]);
			}
		}
	}
				
	else{
		int b=0;
		while(b<=1000){
			if(b%100==0){
				printf("parent pid %d %d\n", getppid(),b);
			}
			b++;
		}
		
	}
	return 0;
}
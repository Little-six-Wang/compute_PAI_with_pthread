#include<stdio.h>
#include<stdlib.h>
#include<pthread.h>
#include"parameters.h"

void* compute_pai(void* rank);
double dclock();

int thread_count;
double sum;
long long flag = 0;
long long n;

int main(int argc, char* argv[]){
  long thread;
  pthread_t* thread_handles;
  double time_start = 0.0, time_final = 0.0, time_use = 0.0;
  
  thread_count = strtol(argv[1], NULL, 10);
  
  thread_handles = malloc(thread_count * sizeof(pthread_t));
  
  printf("busy_result = [\n");
  for(n = FIRST; n <= N; n += STEP){
    time_start = dclock();  
    for(thread = 0; thread < thread_count; thread++){
      pthread_create(&thread_handles[thread], NULL, compute_pai, (void*)thread);
    }
    for(thread = 0; thread < thread_count; thread++){
      pthread_join(thread_handles[thread], NULL);
    }
    sum *= 4;
    time_final = dclock();
    time_use = time_final - time_start;
    printf("%lld %lf %lf\n", n, sum, time_use);
    sum = 0.0;
  }
  printf("];\n");
  
  free(thread_handles);
  return 0;
}

/*------------------------------------------------------------------------
 *Function: compute_pai
 *Purpose:  Use "sum((-1)^n * 1 / (2 * n + 1))" to calculate the pie value with busy_waiting
 *In arg:   rank
 *
*/
void* compute_pai(void* rank){
  long my_rank = (long)rank;
  double factor;
  long long i;
  long long my_n = n / thread_count;
  long long my_first = my_rank * my_n;
  long long my_last = my_first + my_n;
  double my_sum = 0.0;
  
  if(my_first % 2 == 0){
    factor = 1.0;
  }else{
    factor = -1.0;
  }
  
  for(i = my_first; i < my_last; i++, factor = -factor){
    my_sum += factor / (2 * i + 1);
  }
  
  while(flag != my_rank);
  sum += my_sum;
  flag = (flag + 1) % thread_count;
  
  return NULL;
  
}

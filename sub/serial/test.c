#include<stdio.h>
#include"parameters.h"

double compute(long long);
double dclock();

int main(){
  long long n;
  long long i;
  double sum = 0.0;
  double time_start = 0.0, time_final = 0.0, time_use = 0.0;
  
  printf("serial_result = [\n");
  for(n = FIRST; n <= N; n += STEP){
    time_start = dclock();
    sum = compute(n);
    time_final = dclock();
    time_use = time_final - time_start;
    
    printf("%lld %lf %lf\n", n, sum, time_use);
  }
  printf("];\n");
  
  return 0;
}

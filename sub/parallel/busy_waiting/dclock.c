#include<sys/time.h>
#include<time.h>

static double start_time = 0.0;

double dclock(){
  struct timeval tv;
  double the_time;
  
  gettimeofday(&tv, NULL);
  
  //before
  if(start_time == 0.0){
    start_time = (double)tv.tv_sec;
  }
  the_time = tv.tv_sec - start_time;
  the_time = the_time + tv.tv_usec * 1.0e-6;
  return the_time;
}

double compute(long long N){
  double factor = 1.0;
  double sum = 0.0;
  long long i;
  for(i = 0; i < N; i++, factor = -factor){
    sum += factor / (2 * i + 1);
  }
  sum *= 4;
  return sum;
}

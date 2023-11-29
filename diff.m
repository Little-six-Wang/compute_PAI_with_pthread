# load data
source('output_serial.m');
result_serial = serial_result;
source('output_parallel_busy_waiting_1.m');
result_busy_1 = busy_result;
source('output_parallel_busy_waiting_2.m');
result_busy_2 = busy_result;
source('output_parallel_busy_waiting_4.m');
result_busy_4 = busy_result;
source('output_parallel_busy_waiting_8.m');
result_busy_8 = busy_result;
source('output_parallel_busy_waiting_16.m');
result_busy_16 = busy_result;
source('output_parallel_mutex_1.m');
result_mutex_1 = busy_result;
source('output_parallel_mutex_2.m');
result_mutex_2 = busy_result;
source('output_parallel_mutex_4.m');
result_mutex_4 = busy_result;
source('output_parallel_mutex_8.m');
result_mutex_8 = busy_result;
source('output_parallel_mutex_16.m');
result_mutex_16 = busy_result;

diff1 = [1, max(result_busy_1(:, 2) - result_serial(:, 2)), max(result_mutex_1(:, 2) - result_serial(:, 2))];
diff2 = [2, max(result_busy_2(:, 2) - result_serial(:, 2)), max(result_mutex_2(:, 2) - result_serial(:, 2))];
diff4 = [4, max(result_busy_4(:, 2) - result_serial(:, 2)), max(result_mutex_4(:, 2) - result_serial(:, 2))];
diff8 = [8, max(result_busy_8(:, 2) - result_serial(:, 2)), max(result_mutex_8(:, 2) - result_serial(:, 2))];
diff16 = [16, max(result_busy_16(:, 2) - result_serial(:, 2)), max(result_mutex_16(:, 2) - result_serial(:, 2))];

result = [diff1; diff2; diff4; diff8; diff16];

save diff.txt result

clear all
close all

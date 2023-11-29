clear all
close all

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
result_mutex_1 = mutex_result;
source('output_parallel_mutex_2.m');
result_mutex_2 = mutex_result;
source('output_parallel_mutex_4.m');
result_mutex_4 = mutex_result;
source('output_parallel_mutex_8.m');
result_mutex_8 = mutex_result;
source('output_parallel_mutex_16.m');
result_mutex_16 = mutex_result;

x = result_serial(:, 1)';

# serial and parallel_busy_waiting
figure(1);
serial_time = result_serial(:, 3);
plot(x, serial_time, 'r')

hold on
busy_1_time = result_busy_1(:, 3);
plot(x, busy_1_time, 'g')

hold on
busy_2_time = result_busy_2(:, 3);
plot(x, busy_2_time, 'g')

hold on
busy_4_time = result_busy_4(:, 3);
plot(x, busy_4_time, 'g')

hold on
busy_8_time = result_busy_8(:, 3);
plot(x, busy_8_time, 'g')

xlabel("n")
ylabel("time\sec")
title("Time_serial_parallelBusy")
legend("serial", "parallel_busy")
print( "time_busy", '-dpng' )

# serial and parallel_mutex
figure(2);
serial_time = result_serial(:, 3);
plot(x, serial_time, 'r')

hold on
mutex_1_time = result_mutex_1(:, 3);
plot(x, mutex_1_time, 'b')

hold on
mutex_2_time = result_mutex_2(:, 3);
plot(x, mutex_2_time, 'b')

hold on
mutex_4_time = result_mutex_4(:, 3);
plot(x, mutex_4_time, 'b')

hold on
mutex_8_time = result_mutex_8(:, 3);
plot(x, mutex_8_time, 'b')

xlabel("n")
ylabel("time\sec")
title("Time_serial_parallelMutex")
legend("serial", "parallel_mutex")
print( "time_mutex", '-dpng' )

# when count of thread is 16(Exceeds the number of cores), Comparison of busy and mutex time
figure(3);
serial_time = result_serial(:, 3);
plot(x, serial_time, 'r')

hold on
busy_16_time = result_busy_16(:, 3);
plot(x, busy_16_time, 'g')

hold on
mutex_16_time = result_mutex_16(:, 3);
plot(x, mutex_16_time, 'b')

xlabel("n")
ylabel("time\sec")
title("Time_parallelBusy16_parallelMutex16")
legend("serial", "parallel_busy", "parallel_mutex")
print( "time_compare_busy16_mutex16", '-dpng' )

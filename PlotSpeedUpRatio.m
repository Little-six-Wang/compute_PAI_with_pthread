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

# get the time
#serial time
serial_time = result_serial(:, 3);

#parallel_busy time
busy_1_time = result_busy_1(:, 3);
busy_2_time = result_busy_2(:, 3);
busy_4_time = result_busy_4(:, 3);
busy_8_time = result_busy_8(:, 3);
busy_16_time = result_busy_16(:, 3);

#parallel_mutex time
mutex_1_time = result_mutex_1(:, 3);
mutex_2_time = result_mutex_2(:, 3);
mutex_4_time = result_mutex_4(:, 3);
mutex_8_time = result_mutex_8(:, 3);
mutex_16_time = result_mutex_16(:, 3);

#compute SpeedUpRatio
#serial
serial_speed = serial_time ./ serial_time;

#parallel_busy SpeedUpRatio
busy_1_speed = serial_time ./ busy_1_time;
busy_2_speed = serial_time ./ busy_2_time;
busy_4_speed = serial_time ./ busy_4_time;
busy_8_speed = serial_time ./ busy_8_time;
busy_16_speed = serial_time ./ busy_16_time;

#parallel_mutex_SpeedUpRatio
mutex_1_speed = serial_time ./ mutex_1_time;
mutex_2_speed = serial_time ./ mutex_2_time;
mutex_4_speed = serial_time ./ mutex_4_time;
mutex_8_speed = serial_time ./ mutex_8_time;
mutex_16_speed = serial_time ./ mutex_16_time;

# plot the SpeedUpRatio of parallel_busy
#figure(1);
busy_speed = [serial_speed, busy_1_speed, busy_2_speed, busy_4_speed, busy_8_speed, busy_16_speed]';
plot(x, busy_speed)

title("SpeedUpRatio_parallelBusy")
xlabel("n")
ylabel("SpeedUpRatio")
legend("serial_speed", "busy_1_speed", "busy_2_speed", "busy_4_speed", "busy_8_speed", "busy_16_speed")
print("SpeedUpRatio_busy", '-dpng')

#plot the SpeedUpRatio of parallel_mutex
figure(2);
mutex_speed = [serial_speed, mutex_1_speed, mutex_2_speed, mutex_4_speed, mutex_8_speed, mutex_16_speed]';
plot(x, mutex_speed)

title("SpeedUpRatio_parallelMutex")
xlabel("n")
ylabel("SpeedUpRatio")
legend("serial_speed", "mutex_1_speed", "mutex_2_speed", "mutex_4_speed", "mutex_8_speed", "mutex_16_speed")
print("SpeedUpRatio_mutex", '-dpng')

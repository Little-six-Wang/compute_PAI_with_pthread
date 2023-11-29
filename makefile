CC = gcc
CFLAGS = -Wall
LIB = -lpthread

EXE = exec

target1 = test
target2 = compute_pai_busy
target3 = compute_pai_mutex

THREAD = 16

PARALLEL_BUSY = busy_waiting_$(THREAD)
PARALLEL_MUTEX = mutex_$(THREAD)

export CC CFLAGS LIB EXE target1 target2 target3

clean:
	rm -f $(EXE)/* sub/parallel/busy_waiting/*.o sub/parallel/mutex/*.o sub/serial/*.o
run:
	@#make -C sub/serial
	make -C sub/parallel/busy_waiting
	make -C sub/parallel/mutex
	@#echo "version = 'serial';" > output_serial.m
	echo "version = 'parallel_$(PARALLEL_BUSY)';" > output_parallel_$(PARALLEL_BUSY).m
	echo "version = 'parallel_$(PARALLEL_MUTEX)';" > output_parallel_$(PARALLEL_MUTEX).m
	@#./$(EXE)/$(target1) >> output_serial.m
	./$(EXE)/$(target2) $(THREAD) >> output_parallel_$(PARALLEL_BUSY).m
	./$(EXE)/$(target3) $(THREAD) >> output_parallel_$(PARALLEL_MUTEX).m
	make clean

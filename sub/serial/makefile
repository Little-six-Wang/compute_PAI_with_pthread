OBJ = test.o compute.o dclock.o
INCLUDE = -I ./../../include

%.o:%.c
	$(CC) $(CFLAGES) $(INCLUDE) -c $< -o $@
$(target1):$(OBJ)
	$(CC) $(CFLAGES) -g -o ../../$(EXE)/$@ $(OBJ)

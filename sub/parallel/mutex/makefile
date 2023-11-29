OBJ = compute_pai.o dclock.o
INCLUDE = -I ./../../../include

%.o:%.c
	$(CC) $(CFLAGS) $(INCLUDE) -c $< -o $@
$(target3):$(OBJ)
	$(CC) $(CFLAGES) -g -o ../../../$(EXE)/$@ $(OBJ) $(LIB)

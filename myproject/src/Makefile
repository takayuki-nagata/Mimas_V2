SRC = main.c
OBJ = $(SRC:%.c=%.o)

myapp: $(OBJ)
	sh2eb-gcc -static -o $@ $(OBJ)

.c.o:
	sh2eb-gcc -c $<

clean:
	rm -f *.o *.gdb myapp

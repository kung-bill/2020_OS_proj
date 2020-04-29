CC = gcc
.PHONY:	clean
objs:= main.o scheduler.o process.o 
demo: $(objs)
	$(CC) -o demo $(objs)
main.o: main.c process.h scheduler.h
	$(CC) main.c -c
scheduler.o: scheduler.c scheduler.h
	$(CC) scheduler.c -c
process.o: process.c process.h
	$(CC) process.c -c
clean:
	rm -f $(objs)
run:
	sudo ./demo

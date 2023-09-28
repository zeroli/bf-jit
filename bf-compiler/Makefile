bf-compiler: helloworld.o
	gcc -o hello helloworld.o

helloworld.o: helloworld.bf.asm
	as --64 -g helloworld.bf.asm -o helloworld.o

helloworld.bf.asm:
	go run main.go ../helloworld-simple.bf helloworld.bf.asm

clean:
	rm -rf *.asm *.o *.exe

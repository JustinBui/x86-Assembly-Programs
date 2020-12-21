#!/bin/bash

#Author: Justin Bui 
#Program name: Array Sort
#Language: Bash

rm *.o, *.out

echo "Start program."

#C++
g++ -c -g -Wall -m64 -no-pie -o main.o main.cpp -std=c++17

g++ -c -g -Wall -m64 -no-pie -o isinteger.o isinteger.cpp -std=c++17

g++ -c -g -Wall -m64 -no-pie -o display_array.o display_array.cpp -std=c++17

#C
#gcc -c -g -Wall -m64 -no-pie -o <c>.o <c>.c -std=c11

#ASM
nasm -g -F dwarf -f elf64 -o manager.o manager.asm

nasm -g -F dwarf -f elf64 -o read_clock.o read_clock.asm

nasm -g -F dwarf -f elf64 -o input_array.o input_array.asm

nasm -g -F dwarf -f elf64 -o atolong.o atolong.asm

nasm -g -F dwarf -f elf64 -o reverse.o reverse.asm

nasm -g -F dwarf -f elf64 -o swap.o swap.asm


#Linker
g++ -m64 -no-pie -o a.out -std=c++17 main.o isinteger.o display_array.o manager.o read_clock.o input_array.o atolong.o reverse.o swap.o

#Loader
./a.out

echo "End program."
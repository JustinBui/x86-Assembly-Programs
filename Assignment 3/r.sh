#!/bin/bash

#Author: Justin Bui 
#Program name: Array Sort
#Language: Bash

rm *.o, *.out, *.lis

echo "Start Program:"

#Compiling all C files
gcc -c -g -Wall -m64 -no-pie -o bubble_sort.o bubble_sort.c -std=c11

#Compiling all C++ files
g++ -c -g -Wall -m64 -no-pie -o main.o main.cpp -std=c++17		#display_array.cpp

g++ -c -g -Wall -m64 -no-pie -o isinteger.o isinteger.cpp -std=c++17

g++ -c -g -Wall -m64 -no-pie -o display_array.o display_array.cpp -std=c++17

#Compiling all Assembly files
nasm -g -F dwarf -f elf64 -l manager.lis -o manager.o manager.asm

nasm -g -F dwarf -f elf64 -l input_array.lis -o input_array.o input_array.asm

nasm -g -F dwarf -f elf64 -l atolong.lis -o atolong.o atolong.asm

nasm -g -F dwarf -f elf64 -l read_clock.lis -o read_clock.o read_clock.asm

nasm -g -F dwarf -f elf64 -l swap.lis -o swap.o swap.asm 

#Linking all files together
g++ -m64 -no-pie -o a.out -std=c++17 bubble_sort.o main.o isinteger.o display_array.o manager.o input_array.o atolong.o read_clock.o swap.o

#Loader
./a.out

echo "End Program."
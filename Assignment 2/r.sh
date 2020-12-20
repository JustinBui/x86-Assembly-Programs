#!/bin/bash

#Program Name: Arrays
#Author: Justin Bui



rm *.o, *.lis, *out

echo "Start Program: "

#Compiling C Files:
gcc -c -g -Wall -m64 -no-pie -o main.o main.c -std=c11					#main.c


#Assembling ASM Files:
nasm -g -F dwarf -f elf64 -l manager.lis -o manager.o manager.asm			#manager.asm

nasm -g -F dwarf -f elf64 -l input_array.lis -o input_array.o input_array.asm		#input_array.asm

nasm -g -F dwarf -f elf64 -l atol.lis -o atol.o atol.asm				#atol.asm

nasm -g -F dwarf -f elf64 -l sum.lis -o sum.o sum.asm					#sum.asm


#Compiling CPP Files
g++ -c -g -Wall -m64 -no-pie -o display_array.o display_array.cpp -std=c++14		#display_array.cpp

g++ -c -m64 -Wall -fno-pie -no-pie -o isinteger.o isinteger.cpp -std=c++17		#isinteger.cpp


#Linking all object files
gcc -m64 -no-pie -o arithmetic.out -std=c11 main.o manager.o input_array.o display_array.o isinteger.o atol.o sum.o

./arithmetic.out

echo "End Program"






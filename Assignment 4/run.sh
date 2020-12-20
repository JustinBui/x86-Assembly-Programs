#!/bin/bash

#Author: Justin Bui
#Program name: Circumference of Circle (2) 
#Language: Bash

rm *.o, *.out

echo "Start Program"

#C
gcc -c -g -Wall -m64 -no-pie -o circumference.o circumference.c -std=c11

#ASM
nasm -g -F dwarf -f elf64 -o circle.o circle.asm

#Linker
g++ -m64 -no-pie -o a.out -std=c++17 circumference.o circle.o 

./a.out

echo "End Program"
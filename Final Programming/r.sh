#!/bin/bash

#Author: Justin Bui 
#Program name: Array Sort
#Language: Bash

rm *.o, *.out


#C++
g++ -c -g -Wall -m64 -no-pie -o isfloat.o isfloat.cpp -std=c++17

#C
gcc -c -g -Wall -m64 -no-pie -o grosspay.o grosspay.c -std=c11

#ASM
nasm -g -F dwarf -f elf64 -o compute.o compute.asm

#Linker
g++ -m64 -no-pie -o a.out -std=c++17 grosspay.o isfloat.o compute.o 

./a.out
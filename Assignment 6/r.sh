#!/bin/bash

#Author: Justin Bui
#Program name: The Harmonic Sum 
#Language: Bash


rm *.o, *.out

echo "-------------------START PROGRAM-------------------\n"

#C++
g++ -c -g -Wall -m64 -no-pie -o main.o main.cpp -std=c++17


#ASM
nasm -g -F dwarf -f elf64 -o manager.o manager.asm

nasm -g -F dwarf -f elf64 -o read_clock.o read_clock.asm

nasm -g -F dwarf -f elf64 -o getfrequency.o getfrequency.asm


#Linker
g++ -m64 -no-pie -o a.out -std=c++17 main.o manager.o read_clock.o getfrequency.o

./a.out

echo "\n-------------------END PROGRAM-------------------"
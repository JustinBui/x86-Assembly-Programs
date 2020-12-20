#!/bin/bash

#Program Name: Circumference of Circle
#Author: Justin Bui

#Descripton: This is the bash file used to put together the main file circle.asm
#with the driver file egypt.c. This can be ran by typing sh run.sh


#Assembling circle.asm
nasm -g -F dwarf -f elf64 -l circle.lis -o circle.o circle.asm

#Compiling egypt.c
gcc -c -g -Wall -m64 -no-pie -o egypt.o egypt.c -std=c11

#Linking object files of main and driver
gcc -m64 -no-pie -o math.out -std=c11 circle.o egypt.o

#Runs the program
./math.out

echo "End Program."

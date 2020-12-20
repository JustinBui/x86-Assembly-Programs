/*
;====================================================PROGRAM INFORMATION==============================================================
;Program Name: The Harmonic Sum
;Programming Language: C++
;
;General Purpose: This program takes asks the user to enter in a number. The harmonic sum
;                 is calculated and displayed using n as the user input.
;
;File Description: main.cpp introduces the user and calls manager.asm. It then takes the
;                  result from manager.asm and displays it to the user.
;
;Compile: g++ -c -g -Wall -m64 -no-pie -o main.o main.cpp -std=c++17
;         nasm -g -F dwarf -f elf64 -o manager.o manager.asm
;         nasm -g -F dwarf -f elf64 -o read_clock.o read_clock.asm
;         nasm -g -F dwarf -f elf64 -o getfrequency.o getfrequency.asm
;Link: g++ -m64 -no-pie -o a.out -std=c++17 main.o manager.o read_clock.o getfrequency.o 
;Execute: ./a.out
;=====================================================================================================================================
;
;
;=====================================================ABOUT THE AUTHOR================================================================
;Author: Justin Bui
;Email: Justin_Bui12@csu.fullerton.edu
;Institution: California State University, Fullerton
;Course: CPSC 240-05
;Start Date: 29 November, 2020
;=====================================================================================================================================
;
;
;
;======================================================COPYRIGHT/LICENSING============================================================
;Copyright (C) 2020 Justin Bui
;This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License
;version 3 as published by the Free Software Foundation.
;This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied
;Warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
;A copy of the GNU General Public License v3 is available here:  <https://www.gnu.org/licenses/>.
;=====================================================================================================================================
*/

//===========================================START OF MODULE==========================================================
#include<stdio.h>

extern "C" double harmonic_sum();

int main(){
    double answer;

    printf("Welcome to the Harmonic Sum programmed by Justin Bui.\n");
    answer = harmonic_sum();            //This returns harmonic sum 

    printf("%s%.13lf%s", "The driver received this number ", answer, " and will keep it.\n");       //Printing results
    printf("A zero will be returned to the operating system. Have a nice day\n");

    return 0;
}
//===========================================END OF MODULE============================================================

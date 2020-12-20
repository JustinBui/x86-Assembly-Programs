//====================================================PROGRAM INFORMATION==============================================================
//Program Name: Circumference of Circle (2) 
//Programming Language: C
//
//General Purpose: This program asks the user to enter in a radius of a circle. It then calculates the
//                 circumference and prints out the user the answer. 
//
//File Description: circumference introduces the program and calls circle.asm. It also receives the 
//                  circumference calculated in circle.asm and prints it to the terminal.
//
//Compile: gcc -c -g -Wall -m64 -no-pie -o circumference.o circumference.c -std=c11
//         nasm -g -F dwarf -f elf64 -o circle.o circle.asm
//Link: g++ -m64 -no-pie -o a.out -std=c++17 circumference.o circle.o 
//Execute: ./a.out
//=====================================================================================================================================
//
//
//=====================================================ABOUT THE AUTHOR================================================================
//Author: Justin Bui
//Email: Justin_Bui12@csu.fullerton.edu
//Institution: California State University, Fullerton
//Course: CPSC 240-05
//Start Date: 3 November, 2020
//=====================================================================================================================================
//
//
//
//======================================================COPYRIGHT/LICENSING============================================================
//Copyright (C) 2020 Justin Bui
//This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License
//version 3 as published by the Free Software Foundation.
//This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied
//Warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
//A copy of the GNU General Public License v3 is available here:  <https://www.gnu.org/licenses/>.
//======================================================================================================================================

#include<stdio.h>

double findCircumference();

int main(){

    //Intro
    printf("Welcome to your friendly circle circumference calculator\n");
    printf("The main program will now call the circle function\n");

    double circumference = findCircumference();            //Calling circle.asm

    //Printing out results
    printf("Main received this number: %.10lf = 0x%lX.\n", circumference, *(unsigned long*)&circumference);              //Answer is in 19 decimal point precision
    printf("Have a nice day, main will return 0 to the operating system.\n");

    return 0;
}
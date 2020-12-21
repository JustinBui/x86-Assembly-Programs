/*
;====================================================PROGRAM INFORMATION==============================================================
;Program Name: Gross Pay
;Programming Language: C
;
;General Purpose: This program asks the user to take in 2 floats: one for hours worked and 
;                 another for pay rate per hour. The gross pay is then calculated. Anything
;                 over 40 hours is considered over time, but will be added into the gross pay.
;
;File Description: grosspay.c introduces the user and calls compute.asm. It then takes the gross
;                  pay calculated from compute.asm and displays it to the terminal.
;
;Start Date: 14 December, 2020
;
;Compile: g++ -c -g -Wall -m64 -no-pie -o isfloat.o isfloat.cpp -std=c++17
;         gcc -c -g -Wall -m64 -no-pie -o grosspay.o grosspay.c -std=c11
;         nasm -g -F dwarf -f elf64 -o compute.o compute.asm
;Link: g++ -m64 -no-pie -o a.out -std=c++17 grosspay.o isfloat.o compute.o  
;Execute: ./a.out
;=====================================================================================================================================
;
;
;=====================================================ABOUT THE AUTHOR================================================================
;Author: Justin Bui
;Email: Justin_Bui12@csu.fullerton.edu
;Institution: California State University, Fullerton
;Course: CPSC 240-05
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

//==========================================================START OF MODULE============================================================

#include<stdio.h>

double compute();

int main(){
    double recieved;

    printf("CPSC 240-05 Final\n");
    recieved = compute();

    printf("The driver received %0.2lf and will keep it\n", recieved);
    printf("Bye\n");

    return 0;
}

//===========================================END OF MODULE================================================

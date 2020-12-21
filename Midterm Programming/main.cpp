/*
;====================================================PROGRAM INFORMATION==============================================================
;Program Name: Reverse an Array
;Programming Language: C++
;
;General Purpose: This program asks the user to input some integers into an array. It then displays 
;				  all numbers in the array but sorted. It then displays that same array in inverse.
;
;File Description: main.cpp introduces the usercalls manager.asm. It also calls read_clock to keep track of the 
;                  time in tics before and after manager is called. It then gives the user farewell messages
;                  before the program terminates.
;
;Start Date: 26 November, 2020
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

extern "C" long manager();
extern "C" long read_clock();

int main(){
    long ticks;
    long returned_value;

    //Showing initial tick of CPU
    ticks = read_clock();
    printf("Welcome to midterm by Roland Smitzes\n");
    printf("The array manager will begin.\n");
    printf("Current tics is %ld\n", ticks);


    returned_value = manager();      //Calling manager to do everything else

    //Updating ticks of CPU
    ticks = read_clock();
    printf("Current tics is %ld\n", ticks);

    //Outro. Telling the user goodbye

    printf("The driver received %ld and doesn't know what to do with it.\n", returned_value);
    printf("Have a nice day\n");

    return 0;
}

//============================================================END OF MODULE==============================================================

//=====================================================================================================================================
//Program Name: Array Sort
//Programming Language: C
//File Description: bubble_sort.c is an algorithm that sorts the array of itegers in ascending order.
//General Purpose: This program asks the user to input integers into an array to get it sorted in ascending order. Display 
//				  this array before sort and after. 


//Author: Justin Bui
//Email: Justin_Bui12@csu.fullerton.edu
//Institution: California State University, Fullerton
//Course: CPSC 240-05
//Start Date: 25 October, 2020

//Copyright (C) 2020 Justin Bui
//This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License
//version 3 as published by the Free Software Foundation.
//This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied
//Warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
//A copy of the GNU General Public License v3 is available here:  <https://www.gnu.org/licenses/>.
//======================================================================================================================================


#include<stdio.h>
#include<ctime>

extern "C" long int manageSortFunctions();      //"C" directive to use standard CCC to pass parameters into function
extern "C" long int get_tics();

int main(){
    //Getting initial time before the program runs.
    long int numberReceived;
    long int myTics = get_tics();

    printf("The time on the CPU clock is now %ld tics\n", myTics);
    printf("Welcome to array sorting program\n");
    printf("Brought to you by Justin Bui\n");

    numberReceived = manageSortFunctions();         //Calling manager
    printf("Main received %ld and plans to keep it\n", numberReceived);
    printf("Main will return 0 to the operating system. Bye\n");
    
    //Getting time after the program runs.
    myTics = get_tics();
    printf("The time on the CPU clock is now %ld tics\n", myTics);

    return 0;
}
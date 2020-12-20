//====================================================PROGRAM INFORMATION==============================================================
//Program Name: Area of Triangle
//Programming Language: C++
//
//General Purpose: This program asks the user to enter 3 quardword floats to represent the length of
//                 the 3 sides of a triangle. The area of the triangle will be calculated
//                 and displayed to the user. 
//
//File Description: isfloat.cpp takes in an array of characters to determine if the input
//                  is a valid floating point number. If so, return true. If not, return false.
//
//Compile: g++ -c -g -Wall -m64 -no-pie -o isfloat.o isfloat.cpp -std=c++17
//         gcc -c -g -Wall -m64 -no-pie -o triangle.o triangle.c -std=c11
//         nasm -g -F dwarf -f elf64 -o area.o area.asm
//Link: g++ -m64 -no-pie -o a.out -std=c++17 isfloat.o triangle.o area.o 
//Execute: ./a.out
//=====================================================================================================================================
//
//
//=====================================================ABOUT THE AUTHOR================================================================
//Author: Justin Bui
//Email: Justin_Bui12@csu.fullerton.edu
//Institution: California State University, Fullerton
//Course: CPSC 240-05
//Start Date: 10 November, 2020
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


//===============================================START OF MODULE=========================================================================
#include<stdio.h>
#include<string>
#include<cctype>
#include<math.h>

extern "C" bool isfloat(char[]);

bool isfloat(char digit[]){
    bool trueNumber = true;
    unsigned int dots = 0;
    long unsigned startIndex = 0;      //Used for index in for loop

   
        //Checking for any '+' or '-' on first index
        if(digit[0] == '-' || digit[0] == '+'){      //If negative or positive sign located, shift index up    
            startIndex++;
        }
        else if (!isdigit(digit[0])){
            trueNumber = false;
        }

        while(digit[startIndex] != '\0'){
            if(!isdigit(digit[startIndex])){
                if(digit[startIndex] == '.'){
                    //Decimal point found
                    dots++; 
                    if(dots > 1) trueNumber = false;        //If more than one decimal point is inputted. 
                }
                else trueNumber = false;
            }
            startIndex++;
        }
        
    return trueNumber;
}
//===============================================END OF MODULE============================================================================


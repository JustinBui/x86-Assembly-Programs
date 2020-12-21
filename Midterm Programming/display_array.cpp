//=====================================================================================================================================
//Program Name: Reverse an Array
//Programming Language: C++
//File Description: This takes in the array defined in manager.asm and current amount of items in array to print out each
//integer in the array.

//Author: Justin Bui
//Email: Justin_Bui12@csu.fullerton.edu
//Institution: California State University, Fullerton
//Course: CPSC 240-05
//Start Date: 18 September, 2020

//Copyright (C) 2020 Justin Bui
//This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License
//version 3 as published by the Free Software Foundation.
//This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied
//Warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
//A copy of the GNU General Public License v3 is available here:  <https://www.gnu.org/licenses/>.
//======================================================================================================================================

//==================================================START OF MODULE======================================================================
//Note: Reference from assignment 2
#include<stdio.h>
using namespace std;

extern "C" void display_array(long array[], long amount);

void display_array(long array[], long amount){
	for (int i = 0; i < amount; ++i){
		printf("%ld ", array[i]);
	}
	printf("\n\n");
}
//==================================================END OF MODULE======================================================================

//=====================================================================================================================================
//Program Name: Arrays
//Programming Language: C
//Program Description: This program asks the user to enter a set of integers into an array to then be returned the sum
//of all integers and current number of elements in the array.


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

#include<stdio.h>

long determineSum();

int main(){

	printf("Welcome to Arrays of Integers\n");
	printf("Brought to you by Justin Bui\n");
	long total = determineSum();
	printf("Main received %ld, and is not sure what to do with it.\n", total);
	printf("Main will return 0 to the operating system. Bye.\n");

	return 0;
}

/***********************************************************************************************************
 * 

Program Name: Circumference of Circle
Programming Language: C
Program Description: This is the driver program used to Welcome the user. C functions like printf and scanf
are used in the main assembly program, where most of the logic belongs.

Author: Justin Bui
Email: Justin_Bui12@csu.fullerton.edu
Institution: California State University, Fullerton
Course: CPSC 240-05

Copyright (C) 2020 Justin Bui
This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License
version 3 as published by the Free Software Foundation.
This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied
Warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
A copy of the GNU General Public License v3 is available here:  <https://www.gnu.org/licenses/>.



************************************************************************************************************/



#include<stdio.h>

//Fuctions defined in circle.asm
long int start();

int main(){
	long int quotient = -999;

	printf("Welcome to your friendly circle circumference calculator.\n");
	quotient = start();

	printf("The main received this integer: %ld\n", quotient);
	printf("Have a nice day. Main will now return 0 to the operating system.\n");

	return 0;
}

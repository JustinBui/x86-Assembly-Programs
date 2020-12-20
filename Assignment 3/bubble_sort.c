//=====================================================================================================================================
//Program Name: Array Sort
//Programming Language: C
//File Description: bubble_sort.c is an algorithm that sorts the array of itegers in ascending order.
//General Purpose: This program asks the user to input integers into an array to get it sorted in ascending order. Display 
//				  this array before sort and after. 
//Reference: https://www.geeksforgeeks.org/c-program-for-bubble-sort/



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

void swap(long *a, long *b);

void bubble_sort(long arr[], long n){
    
   int i, j; 
   for (i = 0; i < n-1; i++)       
  
       // Last i elements are already in place    
       for (j = 0; j < n-i-1; j++)  
           if (arr[j] > arr[j+1]) 
              swap(&arr[j], &arr[j+1]); 
    
}


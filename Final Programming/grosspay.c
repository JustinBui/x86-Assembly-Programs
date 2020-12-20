//NAME: Justin Bui
//DATE: Dec 14
//CWID: 887956068

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
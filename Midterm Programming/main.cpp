//NAME: Justin Bui
//CPSC 240-05 MIDTERM 


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
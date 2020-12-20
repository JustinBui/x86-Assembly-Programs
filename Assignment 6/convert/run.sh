rm *.o *.lis *.out

nasm -f elf64 -l convert.lis -o convert.o convert.asm
nasm -f elf64 -l getfrequency.lis -o getfrequency.o getfrequency.asm

g++ main.cpp -c -m64 -Wall -o main.o -fno-pie -no-pie -std=c++17

g++ -m64 -fno-pie -no-pie -o program.out -std=c++17 main.o convert.o getfrequency.o

./program.out

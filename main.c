#include <msp430.h> 


/**
 * main.c
 */


int sum(int b1, int b2); // function prototype. This is needed to make the function work.

int main(void)
{
    WDTCTL = WDTPW | WDTHOLD;   // stop watchdog timer


    int binaryTotal = 0;

    int Binary1 = 0b1010111101011111; // Binary to decimal its 53087
    int Binary2 = 0b1010111101010001; // Binary to decimal its 44881


    binaryTotal = sum(Binary1,Binary2); // Gets the function sum to take into both binaries and addes them

    while(1);
    return 0;
}

int sum(int b1, int b2)
{
    int tosender = 0;

    tosender = b1+b2;
 return tosender;
}

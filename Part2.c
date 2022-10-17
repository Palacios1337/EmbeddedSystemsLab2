#include <msp430.h> 

int sum(int b1, int b2); // function prototype. This is needed to make the function work.

int main(void)
{
    WDTCTL = WDTPW | WDTHOLD;   // stop watchdog timer


    int binaryTotal = 0; // initialize the value

    int Binary1 = 0b1010111101011111; // signed 16 bit binary number
    int Binary2 = 0b1010111101010001; //signed 16 bit binary number


    binaryTotal = sum(Binary1,Binary2); // Gets the function sum to take into both binaries and addes them

    while(1);
    return 0;
}

int sum(int b1, int b2) // takes two integers in this case binary numbers
{
    int tosender = 0; // initialize value
    tosender = b1+b2; // add both binary numbers
 return tosender; // returns
}

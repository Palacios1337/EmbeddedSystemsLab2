#include <msp430.h> 

float Germs = 3.14; // Global float Variable Germ with value 3.14

int main(void)
{
	WDTCTL = WDTPW | WDTHOLD;	// stop watchdog timer
	

	int Juan = 4; // Local  int Variable Juan with value 4
	unsigned char a = 0x0e; // local unsigned char variable a with 0x0f;
	unsigned char b = 0x05; // local unsigned char variable b with 0x05;
	unsigned char c = 0x00; // Store and show the operational and
	unsigned char d = 0x00; // store and show the operational or

	Juan = Juan + 1; // My version of incrementing the int variable juan by 1
	Germs = Germs - 1; // My versino of decerenting the float variable Germs by 1


	c = a&b; // Operational And to a and b stored in a
	d = a|b; // Operational Or to A and B stored in b

	return 0;
}

/**
Assignment 11.

A superclass Binary has been defined to accept a binary number and a subclass ToHex has been defined to
convert binary number into its equivalent hexadecimal number using short cut logic of combining bits. Some of the
members of the class are given below:


Class name : Binary


Data members

n : stores the binary number


Member functions:

BinHex(int n) : constructor to initialize the data member

void display(): display the binary number


Class name: ToHex


Data member:

hex: to store hexadecimal number


Methods:

ToHex(...): parameterized constructor

void bin_hex() : calculates the hexadecimal equivalent of n and stores it in hex.( using short cut logic of combining bits)

void display() : displays the binary number and hexadecimal number. You can add any extra methods if required.

Using concept of inheritance write details of both the classes and write main method accordingly.

*/

import java.util.Scanner;

class BinHex
{
	// stores the binary number
	int n;

	BinHex(int n)
	{
		// initialize n using local n
		this.n = n;
	}

	void display()
	{
		// local version of n
		int n = this.n;

		// output number
		String output = "";

		// loop through n digits
		// when n is zero exit
		// print each digit of number
		while(n != 0)
		{
			output = n%10 + output;
			n /= 10;
		}

		// display a new line at the end for pretty print
		System.out.println(output);
	}
}

public class ToHex extends BinHex
{
	// to store hexadecimal number
	int hex;

	ToHex(int n)
	{
		// initialize super object
		super(n);

		// hexnumber version of n
		this.hex = 0;
	}

	void bin_hex()
	{
		// local copy of n
		int n = super.n;

		// shift register
		int shl = 0;

		// until n is zero loop
		// generate a number from binary encoded decimal number
		// attaching the number after generation to the hex value
		// remove 4 digits from the end of n
		while(n != 0)
		{
			// decoded binary encoded decimal
			int number = (((n % 10000)/1000) << 3) |
				(((n % 1000)/100) << 2) |
				(((n % 100)/10) << 1) |
				(n % 10);

			this.hex = this.hex | (number << shl);

			n /= 10000;
			shl += 4;
		}
	}

	void display()
	{
		// calling super's display function
		super.display();

		// output number
		String output = "";

		// a character mapper is used for prining
		// a hex character mapper
		char[] hex_map = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};

		// loop through n digits base 16
		// when n is zero exit
		// print each digit of number
		while(hex != 0)
		{
			output = hex_map[hex%16] + output;
			hex /= 16;
		}

		// display a subtle newline at the end
		System.out.println(output);
	}

	public static void main(String arg[])
	{
		// input handler
		Scanner sc = new Scanner(System.in);

		// object is generated using user input
		// to hex object
		ToHex th = new ToHex(sc.nextInt());

		// execute bin_hex
		th.bin_hex();

		// display the usable information
		th.display();
	}
}

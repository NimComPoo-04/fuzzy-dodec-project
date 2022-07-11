/**
Assignment 6.

Given two possible numbers M and N, such that M is between 100 and 10000 and N is less
than 100. Find the smallest integer that greater than M and whose digits add up to N. For
example, if M = 100 and N = 11, then the smallest integer greater than 100 whose digits add
up to 11 is 119


Write a program to accept the numbers M and N from the user and print the smallest required
number whose sum of all its digits is equal to N. Also, print the total number of digits
presnet in the required number. The program should check for the validity of the inputs
display an appropriate message for an invalid input.


Test your program with the sample data and some random data.


Example 1

INPUT:

		M = 100

		N = 11

OUTPUT:

		The required Number = 119

		Total number of digits = 3


Example 2

INPUT:

		M = 1500

		N = 25

OUTPUT:

		The required Number = 1699

		Total number of digits = 4


Example 3

INPUT:

		M = 99

		N = 11

OUTPUT:

		INVALID INPUT

 */

import java.util.Scanner;

public class SumDigit
{
	// lower bound of operations
	int M;

	// the number to be derived from digits
	int N;

	SumDigit(int M, int N)
	{
		// initializing M with local M
		this.M = M;

		// initializing N with local N
		this.N = N;
	}

	int digitSum()
	{
		// create a duplicate of M
		// local version of M for computation
		int M = this.M;

		// stores the sum of digits
		int sum = 0;

		// while M is not 0 loop
		// add all athe digits of M
		// return the added digits
		while(M != 0)
		{
			sum += M%10;
			M /= 10;
		}

		return sum;
	}

	int genNum()
	{
		int digits = -1;

		// check the value of M and N to make sure they are in range
		// if not just return -1 to mark invalid input
		if(this.M >= 10000 || this.M < 100 || this.N > 100)
			return -1;

		// start a loop which to go from M till the upper bound
		// check if any of the numbers is actually the required number
		while(this.M < 10000)
		{
			if(digitSum() == this.N)
			{
				digits = (int)(Math.log10(this.M) + 1);
				break;
			}
			this.M++;
		}

		// if the number is found return the number of digits in the number
		// store the number in M
		// other wise return -1 marking an invalid input
		return digits;
	}

	public static void main(String args[])
	{
		// input handler
		Scanner sc = new Scanner(System.in);

		// accept input from the user
		// use the input to initialize the object
		// call genNum and display the value
		System.out.print("M and N = ");
		SumDigit s = new SumDigit(sc.nextInt(), sc.nextInt());

		//stores the digits
		int digits = s.genNum();

		// if the digit is -1 then it is invalid input
		if(digits == -1)
		{
			System.out.println("INVALID INPUT");
		}
		else
		{
			System.out.println("The required Number = "+s.M);
			System.out.println("Total number of digits = "+digits);
		}
	}
}

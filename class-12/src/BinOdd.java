/**
Assignment 3.

Write a program to take lower and upper range from the user and print all the binodd numbers within
that range. (A binodd number is a number whose binary equivalent have all the 1s present in the odd
position of the binary number considering from MSB to LSB) Example: 17 is a binodd number as its binary
equivalent is 10001 where 1s are in the position 1st and 5th position of the binary number which are odd
position of the number.
*/

import java.util.Scanner ;

public class BinOdd
{
	static boolean isBinOdd(int num)
	{
		// loop until num not equals to zero
		// two bits are checked 
		// if they are not 01 then its an anomly
		// therefore return false
		while(num != 0)
		{
			if((num & 3) != 1)
				return false;
			num >>= 2;
		}

		// otherwise return true
		return true;
	}

	public static void main(String args[])
	{
		// input handler
		Scanner sc = new Scanner(System.in);
		
		System.out.println("Enter upper_limit and lower_limit: ");

		// accpet upper limit
		// upper limit
		int upper_limit = sc.nextInt();

		// accpet lower limit
		// lower limit
		int lower_limit = sc.nextInt();

		// loop from lower limit to upper limit
		// if any big odds are encountered print it
		while(lower_limit < upper_limit)
		{
			if(BinOdd.isBinOdd(lower_limit))
				System.out.println(lower_limit);
			lower_limit++;
		}
	}
}

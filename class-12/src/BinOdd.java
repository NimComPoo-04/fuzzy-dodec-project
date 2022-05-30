import java.util.Scanner ;

/**
Assignment 2.

A BinOdd is a number with properties.
Like most things this number is probably crazy
*/

public class BinOdd
{
	static boolean isBinOdd(int num)
	{
		while(num != 0)
		{
			if((num & 1) > 1)		// binary wizadry
				return false;
			num >>= 2;
		}

		return true;
	}

	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in);

		System.out.print("Enter a Number: ");
		int num = sc.nextInt();

		System.out.println(isBinOdd(num) ? "Yes the number is binodd" : "No the number is not binodd");
	}
}

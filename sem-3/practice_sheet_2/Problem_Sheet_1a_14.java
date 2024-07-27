package ps2;

import java.util.Scanner;

public class Problem_Sheet_1a_14
{
	static void displayDigits(int n)
	{
		System.out.print("Digits: ");
		for(String k : (""+n).split(""))
		{
			System.out.print(k + "  ");
		}
		System.out.println();
	}

	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in);
		System.out.print("Enter a number for digit display: ");

		displayDigits(sc.nextInt());
	}
}

package ps2;

import java.util.Scanner;

public class Problem_Sheet_1a_13
{
	public static void main(String args[])
	{
		System.out.printf("Pound\tUSD\tCAD\tINR\n");
		for(int i = 1; i <= 10; i++)
		{
			System.out.printf("%.2f\t%.2f\t%.2f\t%.2f\n", 10.0 * i, 12.9 * i, 17.8 * i, 1077.2 * i);
		}
	}
}

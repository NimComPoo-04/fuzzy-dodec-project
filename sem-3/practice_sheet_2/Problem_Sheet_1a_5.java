package ps2;

import java.util.Scanner;

public class Problem_Sheet_1a_5
{
	static double revfact(double n)
	{
		long fact = 1;
		double sum = 1.0;
		for(int i = 1; i <= n; i++)
		{
			fact *= i;
			sum += 1.0 / fact;
		}

		return sum;
	}

	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in);
		
		System.out.println("Enter the value of N between (1 - 10): ");
		int n = sc.nextInt();

		if(n < 1 || n > 10)
		{
			System.out.println("Invalid value of n");
			return;
		}

		System.out.println("1 + 1/1! + 1/2! + ... + 1/N! = " + revfact(n));
	}
}

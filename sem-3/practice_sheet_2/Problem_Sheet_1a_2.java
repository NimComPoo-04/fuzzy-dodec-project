package ps2;

import java.util.Scanner;

public class Problem_Sheet_1a_2
{
	static long prod(long n)
	{
		if(n == 1)
			return 1;
		return n * prod(n - 1);
	}

	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in);
		
		System.out.println("Enter the value of N between (1 - 20): ");
		int n = sc.nextInt();

		if(n < 1 || n > 20)
		{
			System.out.println("Invalid value of n");
			return;
		}

		System.out.println("1 * 2 * 3 * ... * N = " + prod(n));
	}
}

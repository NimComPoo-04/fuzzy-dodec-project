package ps2;

import java.util.Scanner;

public class Problem_Sheet_1a_3
{
	static long altsum(long n)
	{
		if(n == 1)
			return 1;
		return n * (n % 2 == 0 ? -1 : 1) + altsum(n - 1);
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

		System.out.println("1 - 2 + 3 - ... ± N = " + altsum(n));
	}
}

package ps2;

import java.util.Scanner;

public class Problem_Sheet_1a_4
{
	static long partsum(long n)
	{
		long ps = 0;
		long s = 0;
		for(int i = 1; i <= n; i++)
		{
			ps += i;
			s += ps;
		}
		return s;
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

		System.out.println("1 + (1 + 2) + (1 + 2 + 3) + ... + (1 + 2 + ... + N) = " + partsum(n));
	}
}

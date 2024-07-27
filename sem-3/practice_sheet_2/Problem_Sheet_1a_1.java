package ps2;

import java.util.Scanner;

public class Problem_Sheet_1a_1
{
	static int sum(int n)
	{
		if(n == 0)
			return 0;
		return n + sum(n - 1);
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

		System.out.println("1 + 2 + 3 + ... + N = " + sum(n));
	}
}

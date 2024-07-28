package ps2;

import java.util.Scanner;

public class Problem_Sheet_1a_10
{
	static int[] calcPower(int n, int k)
	{
		int d = k;
		int count = 0;
		while(n % d == 0)
		{
			d *= k;
			count++;
		}
		return new int[]{count, d / k};
	}

	static void findPrimePowers(int n)
	{
		System.out.println("Prime factors and their powers: ");
		for(int i = 2; i <= n; i++)
		{
			if(n % i == 0)
			{
				int k[] = calcPower(n, i);
				System.out.println("power of " + i + " = " + k[0]);
				n = n / k[1];
			}
		}
	}

	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in);

		System.out.print("Enter a number: ");
		findPrimePowers(sc.nextInt());
	}
}

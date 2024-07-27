package ps2;

import java.util.Scanner;

public class Problem_Sheet_1a_10
{
	static int calcPower(int n, int k)
	{
		int d = k;
		int count = 0;
		while(n % d == 0)
		{
			d *= k;
			count++;
		}
		return count;
	}

	static boolean isPrime(int n)
	{
		if(n == 1)
			return false;
		for(int i = 2; i <= n / i; i++)
			if(n % i == 0)
				return false;
		return true;
	}

	static void findPrimePowers(int n)
	{
		System.out.println("Prime factors and their powers: ");
		for(int i = 2; i <= n; i++)
		{
			if(n % i == 0 && isPrime(i))
				System.out.println("power of " + i + " = " + calcPower(n, i));
		}
	}

	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in);

		System.out.print("Enter a number: ");
		findPrimePowers(sc.nextInt());
	}
}

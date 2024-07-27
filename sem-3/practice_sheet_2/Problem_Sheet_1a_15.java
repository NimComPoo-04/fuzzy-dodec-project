package ps2;

import java.util.Scanner;

public class Problem_Sheet_1a_15
{
	static void pascal(int n)
	{
		int a[] = new int[n];

		for(int i = 0; i < n; i++)
		{
			int t = 1;
			for(int j = 0; j <= i; j++)
			{
				System.out.print(t + " ");
				int d = a[j] + t;
				t = a[j];
				a[j] = d;
			}
			System.out.println();
		}
	}

	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in);
		System.out.print("Enter number of lines: ");
		pascal(sc.nextInt());
	}
}

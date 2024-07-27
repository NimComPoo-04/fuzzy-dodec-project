package ps2;

import java.util.Scanner;

public class Problem_Sheet_1a_7
{
	static void star(int n)
	{
		for(int i = 1; i <= n; i++)
		{
			for(int j = 1; j <= i; j++)
			{
				System.out.print("* ");
			}
			System.out.println();
		}
	}

	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in);	
		System.out.print("Enter number of lines: ");
		star(sc.nextInt());
	}
}

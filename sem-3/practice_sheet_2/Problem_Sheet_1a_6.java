package ps2;

import java.util.Scanner;

public class Problem_Sheet_1a_6
{
	static void floyd(int n)
	{
		int k = 1;
		for(int i = 1; i <= n; i++)
		{
			for(int j = 1; j <= i; j++)
			{
				System.out.print(k + " ");
				k++;
			}
			System.out.println();
		}
	}

	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in);	
		System.out.print("Enter number of lines: ");
		floyd(sc.nextInt());
	}
}

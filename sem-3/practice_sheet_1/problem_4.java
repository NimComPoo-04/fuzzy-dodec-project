package ps1;

import java.util.Scanner;

public class problem_4
{
	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in);
		System.out.println("Enter 2 numbers: ");
		System.out.print("A = ");
		int a = sc.nextInt();
		System.out.print("B = ");
		int b = sc.nextInt();

		int hcf = 1;
		for(int i = 1; i <= (a < b ? a : b); i++)
			if(a % i == 0 && b % i == 0)
				hcf = i;

		System.out.println("HCF = " + hcf);
		System.out.println("LCM = " + (a * b / hcf));
	}
}

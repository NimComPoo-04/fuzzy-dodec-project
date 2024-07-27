package ps1;

import java.util.Scanner;

public class problem_5
{
	static int lcm(int x, int y)
	{
		return (x * y) / hcf(x, y);
	}

	static int hcf(int x, int y)
	{
		if(y == 0)
			return 1;

		if(x % y == 0)
			return y;

		return hcf(y, x % y);
	}

	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in);
		System.out.println("Enter 2 numbers: ");
		System.out.print("A = ");
		int a = sc.nextInt();
		System.out.print("B = ");
		int b = sc.nextInt();

		System.out.println("HCF = " + hcf(a, b));
		System.out.println("LCM = " + lcm(a, b));
	}
}

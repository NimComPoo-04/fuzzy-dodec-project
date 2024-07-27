package ps1;	// problem sheet 1

import java.util.Scanner;

public class problem_1
{
	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in);

		System.out.println("Enter 3 numbers");

		System.out.print("a = ");
		int a = sc.nextInt();

		System.out.print("b = ");
		int b = sc.nextInt();

		System.out.print("c = ");
		int c = sc.nextInt();

		System.out.println("a + b + c     = " + (a + b + c));
		System.out.println("(a + b + c)/3 = " + (a + b + c) / 3);
		System.out.println("max{a, b, c}  = " + Math.max(Math.max(a, b), c));
	}
}

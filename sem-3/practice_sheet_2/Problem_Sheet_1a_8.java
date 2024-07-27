package ps2;

import java.util.Scanner;

public class Problem_Sheet_1a_8
{
	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in);
		System.out.println("Enter 2 numbers: ");

		System.out.print("A = ");
		int a = sc.nextInt();

		System.out.print("B = ");
		int b = sc.nextInt();

		System.out.println("a + b = " + (a + b));
		System.out.println("a - b = " + (a - b));
		System.out.println("a * b = " + (a * b));
		System.out.println("a / b = " + (b == 0 ? "Devisor is zero" : a / b));
		System.out.println("a % b = " + (b == 0 ? "Devisor is zero" : a % b));
	}
}

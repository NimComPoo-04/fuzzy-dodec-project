package ps2;

import java.util.Scanner;

public class Problem_Sheet_1a_11
{
	static void moveData(int a, int b, int c, int d)
	{
		System.out.printf("a = %d  b = %d  c = %d  d = %d\n", a, b, c, d);

		c = c ^ d;
		d = c ^ d;
		c = c ^ d;

		b = c ^ b;
		c = c ^ b;
		b = c ^ b;

		a = a ^ b;
		b = a ^ b;
		a = a ^ b;

		System.out.printf("a = %d  b = %d  c = %d  d = %d\n", a, b, c, d);
	}

	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in);

		System.out.print("Enter 4 integers: ");
		moveData(sc.nextInt(), sc.nextInt(), sc.nextInt(), sc.nextInt());
	}
}

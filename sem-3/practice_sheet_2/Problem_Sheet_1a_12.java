package ps2;

import java.util.Scanner;

public class Problem_Sheet_1a_12
{
	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in);

		System.out.print("Enter 3 numbers: ");

		int p1 = sc.nextInt();
		int p2 = sc.nextInt();
		int p3 = sc.nextInt();

		int max = Math.max(Math.max(p1, p2), p3);
		int min = Math.min(Math.min(p1, p2), p3);
		int mid = p1 + p2 + p3 - max - min;

		int mp1 = (p1 == max ? 1 : (p1 == mid ? 2 : 3 - (p2 == p3 ? 1 : 0)));
		int mp2 = (p2 == max ? 1 : (p2 == mid ? 2 : 3 - (p1 == p3 ? 1 : 0)));
		int mp3 = (p3 == max ? 1 : (p3 == mid ? 2 : 3 - (p1 == p2 ? 1 : 0)));

		System.out.println("position of p1 = " + mp1);
		System.out.println("position of p2 = " + mp2);
		System.out.println("position of p3 = " + mp3);
	}
}

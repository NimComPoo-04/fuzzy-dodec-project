package ps3;

import java.util.Scanner;

public class Q8string
{
	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in);

		System.out.print("Enter one sentences: ");

		String sent = sc.nextLine();

		System.out.print("Enter position: ");

		int n = sc.nextInt();

		System.out.println("Character at = " + sent.charAt(n));
	}
}

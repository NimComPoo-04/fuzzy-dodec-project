package ps3;

import java.util.Scanner;

public class Q2string
{
	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in);

		System.out.print("Enter a sentence: ");

		String sent = sc.nextLine();
		String lower = sent.toLowerCase();

		System.out.println("Original: " + sent);
		System.out.println("Lowercase: " + lower);
	}
}

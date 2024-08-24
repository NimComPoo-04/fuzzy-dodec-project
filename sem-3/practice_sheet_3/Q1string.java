package ps3;

import java.util.Scanner;

public class Q1string
{
	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in);

		System.out.print("Enter a sentence: ");

		String sent = sc.nextLine();
		String upper = sent.toUpperCase();

		System.out.println("Original: " + sent);
		System.out.println("Uppercase: " + upper);
	}
}

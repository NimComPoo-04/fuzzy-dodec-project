package ps3;

import java.util.Scanner;

public class Q3string
{
	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in);

		System.out.print("Input Sentence: ");
		String sent = sc.nextLine();
		System.out.print("Input Pattern: ");
		String pattern = sc.nextLine();
		System.out.print("Input Substitution: ");
		String replace = sc.nextLine();

		String replaced = sent.replace(pattern, replace);

		System.out.println("Original: " + sent);
		System.out.println("Modified: " + replaced);
	}
}

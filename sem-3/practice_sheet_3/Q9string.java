package ps3;

import java.util.Scanner;

public class Q9string
{
	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in);

		System.out.print("Enter a sentence: ");
		String sent = sc.nextLine();

		System.out.print("Enter a pattern: ");
		String pattern = sc.nextLine();

		// count
		int n = 0;

		int indx = sent.indexOf(pattern);
		while(indx >= 0)
		{
			System.out.println("Found at " + indx);
			n++;
			indx = sent.indexOf(pattern, indx + 1);
		}

		System.out.println("Count = " + n);
	}
}

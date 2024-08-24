package ps3;

import java.util.Scanner;

public class Q7string
{
	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in);

		System.out.print("Enter one sentences: ");

		String sent = sc.nextLine();

		System.out.println("Length = " + sent.length());
	}
}

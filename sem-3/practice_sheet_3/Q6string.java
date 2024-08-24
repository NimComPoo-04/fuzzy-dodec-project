package ps3;

import java.util.Scanner;

public class Q6string
{
	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in);

		System.out.print("Enter two sentences: ");

		String first = sc.nextLine();
		String second = sc.nextLine();

		System.out.println("Sentences are " + (first.equalsIgnoreCase(second) ? "equal" : "not equal"));
	}
}

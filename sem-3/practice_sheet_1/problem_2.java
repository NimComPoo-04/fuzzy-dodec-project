package ps1;

import java.util.Scanner;

public class problem_2
{
	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in);

		System.out.print("Enter celcius: ");
		int c = sc.nextInt();

		System.out.println("Conversion Farenheight = " + (c * 9 / 5 + 32));
	}
}

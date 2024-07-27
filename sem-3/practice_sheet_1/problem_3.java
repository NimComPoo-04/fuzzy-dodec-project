package ps1;

import java.util.Scanner;

public class problem_3
{
	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in);

		System.out.print("Enter celcius: ");
		double c = sc.nextDouble();

		System.out.println("Conversion Farenheight = " + (c * 9.0 / 5.0 + 32.0));
	}
}

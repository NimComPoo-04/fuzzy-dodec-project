package ps3;

import java.util.Scanner;

public class Q12string
{
	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in);

		System.out.print("Enter a sentence: ");
		String sent = sc.nextLine();

		int indx = sent.lastIndexOf(" ");

		if(indx == -1)
			return;

		String name = sent.substring(indx + 1) + ", " + sent.substring(0, indx);


		String a = "";
		for(String k : sent.substring(0, indx).split(" "))
		{
			a += k.charAt(0) + ".";
		}

		String abbr = sent.substring(indx + 1) + ", " + a;

		System.out.println(name);
		System.out.println(abbr);
	}
}

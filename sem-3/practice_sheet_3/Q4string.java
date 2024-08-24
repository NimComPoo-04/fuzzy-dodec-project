package ps3;

import java.util.Scanner;

public class Q4string
{
	// manually removing spaces
	static String removeSpace(String str)
	{
		String out = "";

		int state = 0;		// state 0 is for reading non space, state 1 is for reading space

		for(char k : str.toCharArray())
		{
			if(k == ' ' || k == '\t')
			{
				if(state == 0)
					out += k;
				state = 1;
			}
			else
			{
				out += k;
				state = 0;
			}
		}

		return out;
	}

	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in);

		System.out.print("Enter a sentence: ");
		String sent = sc.nextLine();

		String prac = removeSpace(sent.trim());
		String auto = String.join(" ", sent.trim().split(" +"));

		System.out.println("Practice:  " + prac);
		System.out.println("Automatic: " + auto);
	}
}

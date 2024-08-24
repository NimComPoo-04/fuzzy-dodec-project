package ps3;

import java.util.Scanner;

public class Q10string
{
	static Object[] removeWeird(String word)
	{
		String out = "";
		int count = 0;
		int state = 0;		// 0 is for nonalpha 1 is for alpha

		for(char k : (word+"\n").toCharArray())
		{
			if(Character.toLowerCase(k) >= 'a' && Character.toLowerCase(k) <= 'z')
			{
				state = 1;
				out += k;
			}
			else
			{
				if(state == 1)
				{
					count++;
					out += '\n';
				}
				state = 0;
			}
		}

		return new Object[] { out, count };
	}

	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in);

		System.out.print("Enter a sentence: ");
		String sent = sc.nextLine();

		Object o[] = removeWeird(sent);
		System.out.println("Practice: \n" + o[0] + "\ncount = " + o[1] + "\n");

		String k[] = sent.split("[^a-zA-Z]+");
		System.out.println("Automatic: \n" + String.join("\n", k) + "\n\ncount = " + k.length);
	}
}

package ps3;

import java.util.Scanner;

public class Q11string
{
	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in);

		System.out.print("Enter a sentence: ");
		String sent = sc.nextLine();

		int alpha = 0;
		int vowels = 0;
		int cons = 0;

		for(char k : sent.toCharArray())
		{
			if(Character.isLetter(k))
			{
				alpha++;

				if("aeiou".indexOf(k) != -1)
					vowels++;
				else
					cons++;
			}
		}

		System.out.println("Alphabet = " + alpha);
		System.out.println("Vowels = " + vowels);
		System.out.println("Consonants = " + cons);
	}
}

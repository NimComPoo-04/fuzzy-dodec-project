import java.util.Scanner;
public class Sentences_main
{
	public static void main(String args[])
	{
		// input handler
		Scanner sc = new Scanner(System.in);

		// setnece object
		Sentences se = new Sentences(sc.nextLine());
		
		// composited output
		String x = se.getCommonWord();

		// accept input
		// print the required value
		if(x.equals(""))
		{
			System.out.println("NO COMMON WORDS");
		}
		else
		{
			System.out.println(se.sentences[0].trim()+se.raw.charAt(se.sentences[0].length()));
			System.out.println(se.sentences[1].trim()+se.raw.trim().charAt(se.raw.trim().length()-1));
			System.out.println("\nCOMMON WORDS\tFREQUENCY");
			System.out.println(x);
		}
	}
}

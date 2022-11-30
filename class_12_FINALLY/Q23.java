import java.util.Scanner;

public class Q23
{
	String sents[];

	public Q23(String sent[])
	{
		this.sents = sent;
	}

	String frequency()
	{
		String wrds1[] = sents[0].substring(0, sents[0].length()-1).split(" ");
		String wrds2[] = sents[1].substring(0, sents[1].length()-1).split(" ");

		String ferq = "";
		String wrds = "";

		for(int i = 0; i < wrds1.length; i++)
		{
			int f = 0;

			if(wrds.indexOf(wrds1[i]) == -1)
			{
				// own
				for(int j = 0; j < wrds1.length; j++)
				{
					if(wrds1[i].equals(wrds1[j]))
						f++;
				}

				// other
				for(int j = 0; j < wrds2.length; j++)
				{
					if(wrds1[i].equals(wrds2[j]))
						f++;
				}

				wrds += wrds1[i] + " ";
			}

			if(f > 1)
				ferq += wrds1[i] + "\t\t" + f +"\n";
		}

		return ferq;
	}

	// Prints thes common  words
	void common()
	{
		String x = frequency();

		System.out.println(sents[0]);
		System.out.println(sents[1]);

		if(x.equals(""))
			System.out.println("NO COMMON WORDS");
		else
		{
			System.out.println("COMMON WORDS\tFREQUENCY");
			System.out.println(x);
		}
	}

	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in);
		String sent = sc.nextLine();

		String x[] = sent.split("\\?|\\.|\\!");

		if(x.length != 2 || !sent.toUpperCase().equals(sent) || "?.!".indexOf(sent.charAt(sent.length()-1)) == -1)
			System.out.println("INVALID INPUT");
		else
		{
			x[0] += sent.charAt(sent.indexOf(x[1])-1);
			x[1] += sent.charAt(sent.length()-1);

			new Q23(x).common();
		}
	}
}

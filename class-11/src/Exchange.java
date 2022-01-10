import java.util.Scanner;

public class Exchange
{
	private String sent; // stores the sentence
	private String rev;  // to store the new sentence
	private int size;    // stores the length of the sentence

	Exchange()
	{
		this.sent = "";
		this.rev  = "";
		this.size = 0;
	}

	// to accept sentence
	void readsentence()
	{
		Scanner sc = new Scanner(System.in);
		this.sent = sc.nextLine() ;
	}

	// extract each word and 
	void exfirstlast()
	{
		String f[] = this.sent.split(" ") ;

		for(String g : f)
		{
			String t = "" ;
			for(int i = g.length()-1; i >= 0; i--)
			{
				t += g.charAt(i) ;
			}
			this.rev += t + " " ;
		}
	}

	void display()
	{
		System.out.println(this.sent+"\n"+this.rev) ;
	}
}

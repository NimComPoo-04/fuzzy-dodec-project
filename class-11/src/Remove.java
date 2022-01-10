import java.util.Scanner ;

public class Remove
{
	private String sent ; // stores the sentence
	private String rem ; // to store the new sentence
	private int size ;  // stores the length of the sentence

	Remove()
	{
		this.sent = "" ;
		this.rem  = "" ;
		this.size = 0 ;
	}

	void readsentence()
	{
		Scanner sc = new Scanner(System.in) ;

		this.sent = sc.nextLine() ;
		this.size = this.sent.length() ;
	}

	void remfirstlast()
	{
		String words[] = this.sent.split(" ") ;

		for(String word : words)
		{
			// should get something done OwO :)

			if(word.length() < 2) continue ;
			this.rem += word.substring(1, word.length()-1) + " ";
		}
	}

	void display()
	{
		System.out.println(this.sent+"\n"+this.rem) ;
	}
}

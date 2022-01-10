public class Sentence
{
	private String sents[] ;
	private int vows[] ;
	private int words[] ;

	Sentence(String s)
	{
		this.sents = s.split("[?!.]") ;
		this.vows = new int[this.sents.length] ;
		this.words = new int[this.sents.length] ;
	}

	void fill()
	{
		for(int i = 0; i < sents.length; i++)
		{
			words[i] = sents[i].trim().split(" ").length ;
			for(int j = 0; j < sents[i].length(); j++)
			{
				if("aeiouAEIOU".indexOf(sents[i].charAt(j)) >= 0)
					vows[i]++ ;
			}
		}
	}

	void display()
	{
		System.out.println("Sentence\tNo. Of Vowels\tNo.of Words") ;
		for(int i = 0; i < vows.length; i++)
		{
			System.out.println((i+1)+"\t\t"+vows[i]+"\t\t"+words[i]) ;
		}

		System.out.println("\nSentence\tNo. Of Vowels/Words") ;
		for(int i = 0; i < sents.length; i++)
		{
			System.out.print(i+1) ;

			System.out.print("\t\t") ;
			for(int j = 0; j < vows[i]; j++)
				System.out.print('V') ;
			System.out.println() ;

			System.out.print("\t\t") ;
			for(int j = 0; j < words[i]; j++)
				System.out.print('W') ;
			System.out.println() ;
		}
	}
}

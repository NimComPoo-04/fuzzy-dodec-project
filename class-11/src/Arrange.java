public class Arrange
{
	private String sent ;
	private String arr ;

	Arrange(String s)
	{
		this.sent = s ;
		this.arr = "" ;
	}

	void arrange()
	{
		String words[] = this.sent.toLowerCase().substring(0, this.sent.length()-1).split(" ") ;
		
		for(int i = 0; i < words.length; i++)
		{
			for(int j = 0; j < words.length - 1; j++)
			{
				if(words[j].length() < words[j+1].length())
				{
					String k = words[j] ;
					words[j] = words[j+1] ;
					words[j+1] = k ;
				}
				else if(words[j].length() == words[j+1].length())
				{
					if(words[j].compareTo(words[j+1]) < 0)
					{
						String k = words[j] ;
						words[j] = words[j+1] ;
						words[j+1] = k ;
					}
				}
			}
		}

		for(int i = 0; i < words.length ; i++)
		{
			this.arr += words[i] ;
			if(i != words.length - 1)
				this.arr += " " ;
		}

		this.arr = Character.toUpperCase(this.arr.charAt(0)) + this.arr.substring(1) + "." ;
	}

	void display()
	{
		System.out.println(this.sent) ;
		System.out.println(this.arr) ;
	}
}

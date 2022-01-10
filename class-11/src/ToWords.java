public class ToWords
{
	private final String ones[] = {"one", "two", "three", "four", "five", "six", "seven", "eight", "nine"} ;
	private final String teen[] = {"ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"} ;
	private final String tens[] = {"", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"} ;

	String towords(int x)
	{
		String out = "" ;

		int d = (x / 1000) % 10 ;
		int h = (x / 100) % 10 ;
		int t = (x / 10) % 10 ;
		int o = (x / 1) % 10 ;

		if(d != 0) out += ones[d-1] + " thousand " ;
		if(h != 0) out += ones[h-1] + " hundred and " ;
		if(t != 0)
		{
			if(t == 1)
			{
				out += teen[t*10 + o - 10] ;
				o = 0 ;
			}
			else out += tens[t-1] + " " ;
		}
		if(o != 0) out += ones[o - 1] ;

		return out ;
	}
}

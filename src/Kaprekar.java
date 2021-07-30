public class Kaprekar
{
	private int lower_range ; // stores lower range 
	private int upper_range ; // stores upper range

	/* initializes the whole system */
	Kaprekar(int lr, int ur)
	{
		this.lower_range = lr ;
		this.upper_range = ur ;
	}

	/* displays the kaprekar numbers in order of their existance */
	void display()
	{
		for(int i = lower_range; i < upper_range; i++)
		{
			if(iskapraker(i))
				System.out.print(i+", ") ;
		}
		System.out.println() ;
	}

	/* the main function that will determine if the number is really kapraker*/
	boolean iskapraker(int x)
	{
		int sq = x*x ; // the square of the number
		int len = (int)(Math.log10(sq)+1) ; // the total number of digits in sq

		// the half of the number using mathematics
		int part1 = sq % (int)Math.pow(10, (int)Math.floor((len * 1.0)/2.0) + 1) ;
		int part2 = sq / (int)Math.pow(10, (int)Math.ceil((len * 1.0)/2.0)) ;

		//System.out.println(part2+" "+part1) ;

		return (part1+part2 == x) ;
	}
}

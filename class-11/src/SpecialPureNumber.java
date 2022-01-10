public class SpecialPureNumber
{
	boolean isSPN(int x)
	{
		// check if the number of digits in x is even or not
		if((int)(Math.log10(x) + 1) % 2 != 0) return false;

		// loop through all the digits of the number and make sure they
		// are all 4s or 5s

		int d = x ;
		int rev = 0 ; // why waste a fairly good loop lets also find the reverse of x

		while(d != 0)
		{
			if(d % 10 != 4 && d % 10 != 5) return false ;
			rev = rev * 10 + d % 10 ;
			d /= 10 ;
		}

		if(rev != x) return false;

		return true ;
	}
}

public class Octaprime
{
	/* returns the octal variant of the number */
	int octal(int x)
	{
		int oc = 0 ; // octal numbers
		int dmz = 1;
		while(x != 0)
		{
			oc += (x % 8) * dmz;
			dmz *= 10;
			x /= 8 ;
		}
		return oc ;
	}

	/* checks if the number is prime or not */
	boolean isPrime(int x)
	{
		if(x <= 1) return false ;
		for(int i = 2; i < x; i++) if(x % i == 0) return false ;
		return true ;
	}

	/* prints the primes accorsding to the instructions */
	void printoctaprimes(int lr, int ur)
	{
		for(int i = lr; i < ur; i++)
		{
			int o = octal(i) ;
			if(isPrime(o))
				System.out.print(i+", ") ;
		}
		System.out.println() ;
	}
}

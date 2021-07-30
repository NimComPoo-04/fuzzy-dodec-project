public class Pell
{
	/* displays the whole series from start to finish */
	void display(int N)
	{
		int a = 0 ; // starting you know right
		int b = 1 ; // next number
		for(int i = 0; i < N; i++)
		{
			System.out.print(a+", ") ;
			// store result temporarily
			int c = b * 2 + a ;
			a = b  ;
			b = c ;
		}
		System.out.println() ;
	}
}

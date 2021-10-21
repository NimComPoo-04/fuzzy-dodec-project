import java.util.Scanner ;
public class Octaprime_main
{
	/* entery point of the stuff */
	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in) ;
		int lr = 0, ur = 0 ;

		do
		{
			System.out.print("Enter lower ranger: ") ;
			lr = sc.nextInt() ; // lower limit
			System.out.print("Enter upper ranger: ") ;
			ur = sc.nextInt() ; // upper limit
		}while(lr <= 0 || ur <= 0 || ur <= lr) ;

		Octaprime op = new Octaprime() ;
		op.printoctaprimes(lr, ur) ; // outputs the octaprimes
	}
}

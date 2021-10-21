import java.util.Scanner ;
public class Pell_main
{
	/* entery point of the whole program */
	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in);
		int N = 0 ;

		do // I don't want the whole program to collapse
		{
			System.out.print("Enter the value of number of Pell numbers: ") ;
			N = sc.nextInt() ;
			if(N <= 0)
				System.out.println("Number less than 0") ;
		}while(N <= 0) ;

		Pell px = new Pell() ; // object for no damn reason at all
		px.display(N) ; // displays series
	}
}

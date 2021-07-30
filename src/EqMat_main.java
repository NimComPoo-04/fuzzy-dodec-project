import java.util.Scanner ;
public class EqMat_main
{
	// entry point
	public static void main(String args[])
	{
		int m = 0;
		int n = 0;
		Scanner sc = new Scanner(System.in);

		// first input
		do
		{
			System.out.print("Enter the value of m and n respectively: ") ;
			m = sc.nextInt() ;
			n = sc.nextInt() ;
		}while(m <= 0 || n <= 0) ;

		EqMat a = new EqMat(m, n) ;
		System.out.println("Enter array elements: ") ;
		a.readarray() ;

		// reusing the variable because I have no shame
		do
		{
			System.out.print("Enter the value of m and n respectively: ") ;
			m = sc.nextInt() ;
			n = sc.nextInt() ;
		}while(m <= 0 || n <= 0) ;

		EqMat b = new EqMat(m, n) ;
		System.out.println("Enter array elements: ") ;
		b.readarray() ;

		System.out.println("A: ") ;
		a.print() ;

		System.out.println("B: ") ;
		b.print() ;

		// prints relevant message if required.
		if(a.check(a, b) == 1)
			System.out.println("The arrays are equal") ;
		else 
			System.out.println("The arrays are not equal") ;
	}
}

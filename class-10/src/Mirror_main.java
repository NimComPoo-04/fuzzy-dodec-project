import java.util.Scanner ;
public class Mirror_main
{
	// main entry point.
	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in) ;
		System.out.println("M= ") ;
		int M = sc.nextInt() ;
		int A[][] = new int[M][M] ;

		// as the intput is asked :D
		if(M < 2 || M > 22)
		{
			System.out.println("SIZE OUT OF RANGE");
		}
	
		// intput of the array as well
		for(int i = 0; i < M*M; i++)
			A[i/M][i%M] = sc.nextInt() ;

		Mirror mr = new Mirror(M, A) ;
		System.out.println("ORIGINAL MATRIX") ;
		mr.display_original() ;
		System.out.println("MIRROR MATRIX") ;
		mr.display_mirror() ;
	}
}

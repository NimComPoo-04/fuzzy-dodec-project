import java.util.Scanner ;
public class Alternate_main
{
	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in) ;
		int n = 0 ;
		int arr[] = null ;
		int nx[] = null ;

		do{ n = sc.nextInt() ;}while(n <= 0) ;
		arr = new int[n] ;
		nx = new int[n] ;

		
		for(int i = 0; i < n; i++)
			arr[i] = sc.nextInt() ;

		// arr will be sorted after this but who cares
		new Alternate().fill(arr, nx) ;

		// printing i guess
		System.out.println() ;
		for(int i = 0; i < n; i++)
			System.out.print(nx[i]+" ") ;
		System.out.println() ;
	}

}

import java.util.Scanner ;
public class Avarage_main
{
	/* entery point like who in the right mind would have guessed*/
	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in) ;
		System.out.print("Enter number of students: ") ;
		int N = sc.nextInt() ;
		if(N < 0) return ; // best kind of err handeling
		new Avarage().displaySmall(sc, N) ;
	}
}

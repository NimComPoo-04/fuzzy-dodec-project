import java.util.Scanner ;

public class Magic_main
{
	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in);

		System.out.print("N= ") ;
		int N = sc.nextInt() ;

		if(N % 2 == 0)
		{
			System.out.println("INVALID INPUT") ;
			return ;
		}

		Magic m = new Magic(N) ;
		m.gensq() ;
		m.display() ;
	}
}

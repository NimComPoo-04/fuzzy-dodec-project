import java.util.Scanner;

public class SpecialPureNumber_main
{
	public static void main(String args[])
	{
		SpecialPureNumber s = new SpecialPureNumber() ;
		Scanner sc = new Scanner(System.in) ;

		System.out.print("N= ") ;
		int n = sc.nextInt() ;

		if(n > 10 || n <= 0)
		{
			System.out.println("OUT OF RANGE") ;
			return ;
		}

		int i = 10 ;

		while(n != 0)
		{
			if(s.isSPN(i))
			{
				System.out.print(i+" ") ;
				n-- ;
			}
			i++ ;
		}
		System.out.println() ;
	}
}

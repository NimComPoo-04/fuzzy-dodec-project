import java.util.Scanner ;
public class Company_main
{
	// entry point of the program
	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in) ;
		System.out.print("N = ") ;
		int N = sc.nextInt() ;
		if(N < 0 || N > 1000)
		{
			System.out.println("INVALID INPUT") ;
			return ;
		}
		Company c = new Company(N) ;
		c.calculate() ;
		c.pretty_print() ;
	}
}

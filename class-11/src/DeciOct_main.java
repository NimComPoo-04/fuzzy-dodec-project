import java.util.Scanner ;

public class DeciOct_main
{
	public static void main(String args[])
	{
		DeciOct d = new DeciOct() ;
		Scanner sc = new Scanner(System.in) ;

		System.out.print("Enter a Number: ") ;
		d.getnum(sc.nextInt()) ;
		d.show() ;
	}
}

import java.util.Scanner ;
public class Kaprekar_main
{
	/* main entry point */
	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in) ; // input handler
		int lr = 0, ur = 0;

		do
		{
			System.out.print("Enter a lower range: ") ;
			lr = sc.nextInt() ;
			System.out.print("Enter a upper range: ") ;
			ur = sc.nextInt() ;
			if(lr <= 0 || ur <= lr || ur <= 0)
				System.out.println("Wrong Input") ;
		}while(lr <= 0 || ur <= lr || ur <= 0) ;

		Kaprekar kp = new Kaprekar(lr, ur) ;
		kp.display() ; // main interface
	}
}

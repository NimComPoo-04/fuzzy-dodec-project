import java.util.Scanner ;

public class ToWords_main
{
	public static void main(String args[])
	{
		ToWords t = new ToWords() ;
		Scanner sc = new Scanner(System.in) ;

		do
		{
			System.out.print("Enter a Number ------ ") ;
			int x = sc.nextInt() ;

			if(x > 9999 || x < 0)
				System.out.println("Output ---- Invalid entry") ;
			else
				System.out.println("Output ---- " + t.towords(x)) ;

			System.out.print("Want to Continue?(y/n)-------") ;
		}
		while(sc.next().charAt(0) != 'n') ;
	}
}

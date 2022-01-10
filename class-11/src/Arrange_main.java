import java.util.Scanner ;

public class Arrange_main
{
	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in);

		String s = sc.nextLine() ;

		if(s.length() > 80 ||
			Character.isLowerCase(s.charAt(0)) ||
			s.charAt(s.length()-1) != '.')
		{
			System.out.println("Wrong input");
			return;
		}

		Arrange a = new Arrange(s);  
		a.arrange();
		a.display();
	}
}

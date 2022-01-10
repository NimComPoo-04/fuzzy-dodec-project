import java.util.Scanner;

public class Sentence_main
{
	public static void main(String aar[])
	{
		Scanner sc = new Scanner(System.in) ;

		Sentence s = new Sentence(sc.nextLine()) ;
		s.fill() ;
		s.display() ;
	}
}

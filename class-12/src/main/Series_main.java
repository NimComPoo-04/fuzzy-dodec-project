import java.util.Scanner;
public class Series_main
{
	public static void main(String args[])
	{
		// input handler
		Scanner sc = new Scanner(System.in);

		// generates the series from user input
		// series object
		System.out.println("Enter n then x: ");
		Series s = new Series(sc.nextInt(), sc.nextInt());

		// calculate the product
		s.calProd();

		// display the product
		s.display();
	}
}

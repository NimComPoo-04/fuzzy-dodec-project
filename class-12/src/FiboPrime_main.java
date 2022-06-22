import java.util.Scanner;
public class FiboPrime_main
{
	public static void main(String args[])
	{
		// Input handler
		Scanner sc = new Scanner(System.in);

		// create an object using user input
		// call displayFiboPrimes using that object
		new FiboPrime(sc.nextInt()).displayFiboPrimes();
	}
}

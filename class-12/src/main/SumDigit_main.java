import java.util.Scanner;
public class SumDigit_main
{
	public static void main(String args[])
	{
		// input handler
		Scanner sc = new Scanner(System.in);

		// accept input from the user
		// use the input to initialize the object
		// call genNum and display the value
		SumDigit s = new SumDigit(sc.nextInt(), sc.nextInt());

		//stores the digits
		int digits = s.genNum();

		// if the digit is -1 then it is invalid input
		if(digits == -1)
		{
			System.out.println("INVALID INPUT");
		}
		else
		{
			System.out.println("The required Number = "+s.M);
			System.out.println("Total number of digits = "+digits);
		}
	}
}

import java.util.Scanner;
public class BinOdd_main
{
	public static void main(String args[])
	{
		// input handler
		Scanner sc = new Scanner(System.in);

		// accpet upper limit
		// upper limit
		int upper_limit = sc.nextInt();

		// accpet lower limit
		// lower limit
		int lower_limit = sc.nextInt();

		// loop from lower limit to upper limit
		// if any big odds are encountered print it
		while(lower_limit < upper_limit)
		{
			if(BinOdd.isBinOdd(lower_limit))
				System.out.println(lower_limit);
			lower_limit++;
		}
	}
}

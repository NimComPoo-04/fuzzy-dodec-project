import java.util.Scanner;

public class Q24
{
	// checks if some stuff is fascinating 
	boolean isFascinating(int x)
	{
		// to counter act split spaces are added
		String f = " " + x + (x*2) + (x*3) + " ";

		// checks if there is exactly 1 occurence of 1-9 of numbers
		for(int i = 1; i <= 9; i++)
			if(f.split(""+i).length != 2)
				return false;

		return true;
	}

	// lists fascinating numbers
	String listFascinating(int m, int n)
	{
		String output = "";
		for(int i = m; i < n; i++)
		{
			// if fascinating add to output
			if(isFascinating(i))
				output += i+" ";
		}
		return output;
	}

	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in);

		System.out.print("m= ");
		int m = sc.nextInt();
		System.out.print("n= ");
		int n = sc.nextInt();

		String s = new Q24().listFascinating(m, n);
		System.out.println(s.equals("") ? "NIL" : s);
		System.out.println("FREQUENCY OF FASCINATING NUMBERS IS: "+s.trim().split(" ").length);
	}
}

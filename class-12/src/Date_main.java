import java.util.Scanner;
public class Date_main
{
	public static void main(String args[])
	{
		// input system
		Scanner sc = new Scanner(System.in);

		// accept input properly
		// System.out.print("date: ");
		String str_date = sc.next();

		// System.out.print("day on 1st January: ");
		// day of first january
		String jan_1st = sc.next();

		// parsing the input into usable format
		// date array
		int[] date = parse_input(str_date);
		
		// Handles apparent error condition
		if(date == null)
		{
			System.err.println("Malformed Input");
			return;
		}

		// gnenrate object
		Date d = new Date(date[0], date[1], date[2], jan_1st);

		// get generated day
		String new_day = d.generate_day();

		// Handles apparent error condition
		if(new_day == null)
		{
			System.err.println("Input is either out of bounds or nonsensical");
			return;
		}

		// outputs the required day
		System.out.println("day on "+str_date+": " + new_day);
	}
}

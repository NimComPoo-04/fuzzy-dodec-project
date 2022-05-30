import java.util.Scanner;

public class Date
{
	// Stores the names of the days
	private String days_of_week[] = null;

	// number of days in a single month
	private int days_in_month[] = null;

	// Accepted from the user
	private int day;
	private int month;
	private int year;

	// First Day of January
	private String first_day_of_january;

	// initializing standard defaults
	Date(int dd, int mm, int yyyy, String fdoj)
	{
		this.days_of_week = new String[]{"monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"};
		this.days_in_month = new int[]{31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

		this.day = dd;
		this.month = mm;
		this.year = yyyy;

		// Accomodating a Leapyear
		if(yyyy % 4 == 0 && yyyy % 100 != 0 || yyyy % 400 == 0)
			this.days_in_month[1] += 1;

		// formats the string to be sensible for internal use
		this.first_day_of_january = fdoj.trim().toLowerCase();
	}

	// genenrates the required date
	String generate_day()
	{
		// converting first_day_of_january from string to number
		int num_fdoj = -1;
		for(int i = 0; i < this.days_of_week.length; i++)
		{
			if(this.days_of_week[i].equals(this.first_day_of_january))
			{
				num_fdoj = i;
				break;
			}
		}

		// simple error handling
		if(num_fdoj == -1)
			return null;

		int days_from_1stjan = 0;

		// offsetting by day
		days_from_1stjan += this.day-1;

		// offsetting by month
		for(int i = 0; i < this.month-1; i++)
			days_from_1stjan += this.days_in_month[i];

		// correctly offsetting days of year with days of week and converting to string using lookup table;
		String new_day = this.days_of_week[(days_from_1stjan + num_fdoj)%this.days_of_week.length];

		// returning a correctly formatted string for printing
		return (new_day.charAt(0)+"").toUpperCase() + new_day.substring(1);
	}

	// parses the string into a integer array delemetarized with /
	static int[] parse_input(String d)
	{
		String s[] = d.split("/");
		int di[] = new int[]{Integer.parseInt(s[0]), Integer.parseInt(s[1]), Integer.parseInt(s[2])};

		if(di[0] > 31 || di[0] < 1) return null;
		if(di[1] > 12 || di[1] < 1) return null;
		if(di[2] > 9999 || di[2] < 0) return null;	// formatting accroding to dd/mm/yyyy

		return di;
	}

	// manages main input and output
	public static void main(String args[])
	{
		// input system
		Scanner sc = new Scanner(System.in);

		System.out.print("date: ");
		String str_date = sc.next();

		System.out.print("day on 1st January: ");
		String jan_1st = sc.next();

		// parsing the input into usable format
		int date[] = parse_input(str_date);
		
		// Handles apparent error condition
		if(date == null)
		{
			System.err.println("Malformed Input");
			return;
		}

		Date d = new Date(date[0], date[1], date[2], jan_1st);
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

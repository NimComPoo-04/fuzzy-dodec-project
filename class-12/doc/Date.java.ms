

.nr PS 12500
.SH
.DS C
.LG
.LG
.LG
.B

Assignment 1

.NL
.DE
.LP
.br
Write a program to accept a date in format dd/mm/yyyy and accept the name of the day on 1st
January of the corresponding year. Find the day for the given date. Do validation check where required.
.br
ex: input: date:5/7/2001
.br
day on 1st January: Monday
.br
output: day on 5/7/2001: Thursday


.bp
.SH
.DS C
.LG
.LG
.B
Algorithm
.NL
.DE

.LP

.br

.br
.B Date
.br
Step 1:  Start
.br
Step 2:  initialize name of week
.br
Step 3:  initialize number of days in a month
.br
Step 4:  initialize dd mm yy
.br
Step 5:  Accomodate for a Leapyear by adding one if a leapyear is encountered
.br
Step 6:  formats the string to be sensible for internal use
.br
Step 7:  End
.br

.br
.B generate_day
.br
Step 1:  Start
.br
Step 2:  genenrates the required date
.br
Step 3:  converting first_day_of_january from string to number
.br
Step 4:  loop through the days of week if it is found use the index
.br
Step 5:  if it is not foound bail out
.br
Step 6:  simple error handling for a malfromed input
.br
Step 7:  offsetting by day
.br
Step 8:  offsetting by month
.br
Step 9:  by looping through the days of the month
.br
Step 10:  returning a correctly formatted string for printing
.br
Step 11:  End
.br

.br
.B parse_input
.br
Step 1:  Start
.br
Step 2:  formatting accroding to dd/mm/yyyy
.br
Step 3:  End
.br

.br
.B Date
.br
Step 1:  Start
.br
Step 2:  manages main input and output
.br
Step 3:  End
.br

.br
.B main
.br
Step 1:  Start
.br
Step 2:  accept input properly
.br
Step 3:  System.out.print("day on 1st January: ");
.br
Step 4:  parsing the input into usable format
.br
Step 5:  Handles apparent error condition
.br
Step 6:  Handles apparent error condition
.br
Step 7:  outputs the required day
.br
Step 8:  End

.bp
.SH
.DS C
.LG
.LG
.B
Source Code
.NL
.DE
.LP
.SM
.fam C

.br

.br
import java.util.Scanner;
.br

.br
public class Date
.br
{
.br
	// Stores the names of the days
.br
	private String[] days_of_week = null;
.br

.br
	// number of days in a single month
.br
	private int[] days_in_month = null;
.br

.br
	// Accepted from the user
.br
	private int day;
.br

.br
	// Accepted from the user
.br
	private int month;
.br

.br
	// Accepted from the user
.br
	private int year;
.br

.br
	// First Day of January
.br
	private String first_day_of_january;
.br

.br
	Date(int dd, int mm, int yyyy, String fdoj)
.br
	{
.br
		// initialize name of week
.br
		this.days_of_week = new String[]{"monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"};
.br

.br
		// initialize number of days in a month
.br
		this.days_in_month = new int[]{31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
.br

.br
		// initialize dd mm yy
.br
		this.day = dd;
.br
		this.month = mm;
.br
		this.year = yyyy;
.br

.br
		// Accomodate for a Leapyear by adding one if a leapyear is encountered
.br
		if(yyyy % 4 == 0 && yyyy % 100 != 0 || yyyy % 400 == 0)
.br
			this.days_in_month[1] += 1;
.br

.br
		// formats the string to be sensible for internal use
.br
		this.first_day_of_january = fdoj.trim().toLowerCase();
.br
	}
.br

.br
	String generate_day()
.br
	{
.br
		// genenrates the required date
.br
		// converting first_day_of_january from string to number
.br
		// loop through the days of week if it is found use the index
.br
		// if it is not foound bail out
.br

.br
		// num first day of january falls on
.br
		int num_fdoj = -1;
.br
		for(int i = 0; i < this.days_of_week.length; i++)
.br
		{
.br
			if(this.days_of_week[i].equals(this.first_day_of_january))
.br
			{
.br
				num_fdoj = i;
.br
				break;
.br
			}
.br
		}
.br

.br
		// simple error handling for a malfromed input
.br
		if(num_fdoj == -1)
.br
			return null;
.br

.br
		// days from first january
.br
		int days_from_1stjan = 0;
.br

.br
		// offsetting by day
.br
		days_from_1stjan += this.day-1;
.br

.br
		// offsetting by month
.br
		// by looping through the days of the month
.br
		for(int i = 0; i < this.month-1; i++)
.br
			days_from_1stjan += this.days_in_month[i];
.br

.br
		// correctly offsetting days of year with days of week and converting to string using lookup table;
.br
		String new_day = this.days_of_week[(days_from_1stjan + num_fdoj)%this.days_of_week.length];
.br

.br
		// returning a correctly formatted string for printing
.br
		return (new_day.charAt(0)+"").toUpperCase() + new_day.substring(1);
.br
	}
.br

.br
	static int[] parse_input(String d)
.br
	{
.br

.br
		// parses the string into a integer array delemetarized with /
.br
		String[] s = d.split("/");
.br

.br
		// initialize an int array
.br
		int[] di = new int[]{Integer.parseInt(s[0]), Integer.parseInt(s[1]), Integer.parseInt(s[2])};
.br

.br
		// formatting accroding to dd/mm/yyyy
.br
		if(di[0] > 31 || di[0] < 1) return null;
.br
		if(di[1] > 12 || di[1] < 1) return null;
.br
		if(di[2] > 9999 || di[2] < 0) return null;
.br

.br
		return di;
.br
	}
.br

.br
	// manages main input and output
.br
	
.br
}
.br
import java.util.Scanner;
.br
public class Date_main
.br
{
.br
	public static void main(String args[])
.br
	{
.br
		// input system
.br
		Scanner sc = new Scanner(System.in);
.br

.br
		// accept input properly
.br
		// System.out.print("date: ");
.br
		String str_date = sc.next();
.br

.br
		// System.out.print("day on 1st January: ");
.br
		// day of first january
.br
		String jan_1st = sc.next();
.br

.br
		// parsing the input into usable format
.br
		// date array
.br
		int[] date = Date.parse_input(str_date);
.br
		
.br
		// Handles apparent error condition
.br
		if(date == null)
.br
		{
.br
			System.err.println("Malformed Input");
.br
			return;
.br
		}
.br

.br
		// gnenrate object
.br
		Date d = new Date(date[0], date[1], date[2], jan_1st);
.br

.br
		// get generated day
.br
		String new_day = d.generate_day();
.br

.br
		// Handles apparent error condition
.br
		if(new_day == null)
.br
		{
.br
			System.err.println("Input is either out of bounds or nonsensical");
.br
			return;
.br
		}
.br

.br
		// outputs the required day
.br
		System.out.println("day on "+str_date+": " + new_day);
.br
	}
.br
}
.br

.fam
.NL

.bp
.SH
.DS C
.LG
.LG
.B
Varible Listing
.NL
.DE

.LP
.TS
expand center tab(|);
- - - - -
|cb |cb s| cb |cb|
- - - - -
|l |l s| l |l|.
Name|Function|Type|Scope
days_of_week|T{
 Stores the names of the days
T}|String[]|Date
days_in_month|T{
 number of days in a single month
T}|int[]|Date
day|T{
 Accepted from the user
T}|int|Date
month|T{
 Accepted from the user
T}|int|Date
year|T{
 Accepted from the user
T}|int|Date
first_day_of_january|T{
 First Day of January
T}|String|Date
num_fdoj|T{
 num first day of january falls on
T}|int|generate_day
days_from_1stjan|T{
 days from first january
T}|int|generate_day
new_day|T{
 correctly offsetting days of year with days of week and converting to string using lookup table;
T}|String|generate_day
s|T{
 parses the string into a integer array delemetarized with /
T}|String[]|parse_input
di|T{
 initialize an int array
T}|int[]|parse_input
|T{

T}||
|T{

T}||
|T{

T}||
|T{

T}||
|T{

T}||
|T{

T}||
.TE

.bp

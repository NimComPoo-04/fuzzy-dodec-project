.RP no
.nr PS 12500
 
.TL
.LG
.LG
.LG
.LG
Computer Project
.NL
.AU
Aanjishnu Bhattacharyya
.D

.XS 2
Assignment 1
.XA 9
Assignment 2
.XA 14
Assignment 3
.XA 25
Assignment 5
.XA 30
Assignment 6
.XA 36
Assignment 7
.XA 42
Assignment 8
.XA 47
Assignment 9
.XA 60
Assignment 11
.XA 67
Assignment 12
.XA 74
Assignment 13
.XE

.PX

.bp
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
		int[] date = parse_input(str_date);
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
sc|T{
 input system
T}|Scanner|main
str_date|T{
 System.out.print("date: ");
T}|String|main
jan_1st|T{
 day of first january
T}|String|main
date|T{
 date array
T}|int[]|main
d|T{
 gnenrate object
T}|Date|main
new_day|T{
 get generated day
T}|String|main
.TE

.bp
.SH
.DS C
.LG
.LG
.LG
.B

Assignment 2

.NL
.DE
.LP
.br
Write a program to add two times given by the user in hour,min and seconds.
.br

Class name: TimeAdd
.br

Data member: hr(hour),min(minutes),sec(seconds)
.br

Member methods:
.br
TimeAdd(): DEFAULT constructor
.br
void accept(): accept time from user
.br
TimeAdd timeAdd(TimeAdd t): add two time objects return the final time value.
.br
*


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
.B TimeAdd
.br
Step 1:  Start
.br
Step 2:  second
.br
Step 3:  initialize the time
.br
Step 4:  End
.br

.br
.B accept
.br
Step 1:  Start
.br
Step 2:  accept input from the user
.br
Step 3:  check if mins are between 0 and 60
.br
Step 4:  check if mins are between 0 and 60
.br
Step 5:  End
.br

.br
.B timeAdd
.br
Step 1:  Start
.br
Step 2:  add two time objects return final value
.br
Step 3:  generate a new timeadd object
.br
Step 4:  End
.br

.br
.B display
.br
Step 1:  Start
.br
Step 2:  display time in hour, mins and seconds
.br
Step 3:  End
.br

.br
.B main
.br
Step 1:  Start
.br
Step 2:  3 value of Timeadd
.br
Step 3:  accept values for t's
.br
Step 4:  add time objects
.br
Step 5:  display the times
.br
Step 6:  End

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
public class TimeAdd
.br
{
.br
	int hr;		// hours
.br
	int min;	// minuites
.br
	int sec;	// second
.br

.br
	public TimeAdd()
.br
	{
.br
		// initialize the time
.br
		this.hr = 0;
.br
		this.min = 0;
.br
		this.sec = 0;
.br
	}
.br

.br
	void accept()
.br
	{
.br
		// input handler
.br
		Scanner sc = new Scanner(System.in);
.br

.br
		// accept input from the user
.br
		this.hr = sc.nextInt();
.br
		this.min = sc.nextInt();
.br
		this.sec = sc.nextInt();
.br

.br
		// check if mins are between 0 and 60
.br
		if(this.min >= 60 || this.min < 0)
.br
		{
.br
			System.err.println("Minuites make no sense!");
.br
			System.exit(1);
.br
		}
.br

.br
		// check if mins are between 0 and 60
.br
		if(this.sec >= 60 || this.sec < 0)
.br
		{
.br
			System.err.println("Seconds make no sense!");
.br
			System.exit(1);
.br
		}
.br
	}
.br

.br
	TimeAdd timeAdd(TimeAdd t)
.br
	{
.br
		// add two time objects return final value
.br
		// generate a new timeadd object
.br
		// add and store the value of this and t
.br
		TimeAdd x = new TimeAdd();
.br
		x.hr = t.hr + this.hr;
.br
		x.min = t.min + this.min;
.br
		x.sec = t.sec + this.sec;
.br
		return x;
.br
	}
.br

.br
	void display()
.br
	{
.br
		// display time in hour, mins and seconds
.br
		System.out.println("Hr: "+this.hr+"Min:"+this.min+" Sec: "+this.sec);
.br
	}
.br

.br
	public static void main(String args[])
.br
	{
.br
		// 3 value of Timeadd
.br
		// Timeadds
.br
		TimeAdd[] t = new TimeAdd[]{new TimeAdd(), new TimeAdd(), null};
.br

.br
		// accept values for t's
.br
		t[0].accept();
.br
		t[1].accept();
.br

.br
		// add time objects
.br
		t[2] = t[0].timeAdd(t[1]);
.br

.br
		// display the times
.br
		t[0].display();
.br
		t[1].display();
.br
		t[2].display();
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
hr|T{

T}|int|TimeAdd
min|T{
 hours
T}|int|TimeAdd
sec|T{
 minuites
T}|int|TimeAdd
sc|T{
 input handler
T}|Scanner|accept
x|T{
 add and store the value of this and t
T}|TimeAdd|timeAdd
t|T{
 Timeadds
T}|TimeAdd[]|main
.TE

.bp
.SH
.DS C
.LG
.LG
.LG
.B

Assignment 3

.NL
.DE
.LP
.br
Write a program to take lower and upper range from the user and print all the binodd numbers within
that range. (A binodd number is a number whose binary equivalent have all the 1s present in the odd
position of the binary number considering from MSB to LSB) Example: 17 is a binodd number as its binary
equivalent is 10001 where 1s are in the position 1st and 5th position of the binary number which are odd
position of the number.


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
.B isBinOdd
.br
Step 1:  Start
.br
Step 2:  loop until num not equals to zero
.br
Step 3:  two bits are checked 
.br
Step 4:  if they are not 01 then its an anomly
.br
Step 5:  therefore return false
.br
Step 6:  otherwise return true
.br
Step 7:  End
.br

.br
.B main
.br
Step 1:  Start
.br
Step 2:  accpet upper limit
.br
Step 3:  accpet lower limit
.br
Step 4:  loop from lower limit to upper limit
.br
Step 5:  if any big odds are encountered print it
.br
Step 6:  End

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
import java.util.Scanner ;
.br

.br
public class BinOdd
.br
{
.br
	static boolean isBinOdd(int num)
.br
	{
.br
		// loop until num not equals to zero
.br
		// two bits are checked 
.br
		// if they are not 01 then its an anomly
.br
		// therefore return false
.br
		while(num != 0)
.br
		{
.br
			if((num & 3) != 1)
.br
				return false;
.br
			num >>= 2;
.br
		}
.br

.br
		// otherwise return true
.br
		return true;
.br
	}
.br

.br
	public static void main(String args[])
.br
	{
.br
		// input handler
.br
		Scanner sc = new Scanner(System.in);
.br

.br
		// accpet upper limit
.br
		// upper limit
.br
		int upper_limit = sc.nextInt();
.br

.br
		// accpet lower limit
.br
		// lower limit
.br
		int lower_limit = sc.nextInt();
.br

.br
		// loop from lower limit to upper limit
.br
		// if any big odds are encountered print it
.br
		while(lower_limit < upper_limit)
.br
		{
.br
			if(isBinOdd(lower_limit))
.br
				System.out.println(lower_limit);
.br
			lower_limit++;
.br
		}
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
sc|T{
 input handler
T}|Scanner|main
upper_limit|T{
 upper limit
T}|int|main
lower_limit|T{
 lower limit
T}|int|main
.TE

.bp
.SH
.DS C
.LG
.LG
.LG
.B

Assignment 4

.NL
.DE
.LP
.br
Write a program to accept a square matrix CIR[][] of order MXM where M is no. of rows and no. of columns. Value
of M varies from 2 <= M <= 10. Accept alphabet character values in UPPERCASE as input. Display appropriate mess
for invalid input. Perform following tasks.
.br

i) Display Original Matrix.
.br
ii) Find the sum of Unicode values of the elements of four corners of the matrix.
.br
iii) Rotate matrix 90 degrees anti-clockwise and display it 
.br

Example:
.br

INPUT:
.br
		M = 3
.br

		A F D
.br
		D B T
.br
		C A A
.br

OUTPUT:
.br
		Original Matrix:
.br
		A F D
.br
		D B T
.br
		C A A
.br

		Sum = 256
.br

		Final Matrix:
.br
		D T A
.br
		F B A
.br
		A D C
.br
 


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
.B Matrix
.br
Step 1:  Start
.br
Step 2:  initializing M with M
.br
Step 3:  initializing mat of size M by M
.br
Step 4:  End
.br

.br
.B display
.br
Step 1:  Start
.br
Step 2:  loop accross the matrix elements
.br
Step 3:  print each element
.br
Step 4:  End
.br

.br
.B unicodeSum
.br
Step 1:  Start
.br
Step 2:  adding all the corners of the matrix
.br
Step 3:  returning the recorded sum
.br
Step 4:  End
.br

.br
.B rotateMat
.br
Step 1:  Start
.br
Step 2:  loop through the coloums from first to last
.br
Step 3:  loop through the rows from last to first
.br
Step 4:  rotate the mat matrix
.br
Step 5:  setting original matrix to rotated matrix
.br
Step 6:  End
.br

.br
.B readMat
.br
Step 1:  Start
.br
Step 2:  create input handler
.br
Step 3:  accept size as input
.br
Step 4:  loop through the matrix to generate the matrix by accepting input
.br
Step 5:  return the generated matrix
.br
Step 6:  End
.br

.br
.B main
.br
Step 1:  Start
.br
Step 2:  accpting input from user
.br
Step 3:  displaying original matrix
.br
Step 4:  displaying the sum of the corners
.br
Step 5:  roatate the actual matrix
.br
Step 6:  display the rotated matrix
.br
Step 7:  End

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
public class Matrix
.br
{
.br
	// stores the size of square matrix
.br
	int M;
.br

.br
	// stores the matrix itself
.br
	char[][] mat;
.br

.br
	Matrix(int M)
.br
	{
.br
		// initializing M with M
.br
		this.M = M;
.br

.br
		// initializing mat of size M by M
.br
		this.mat = new char[M][M];
.br
	}
.br

.br
	void display()
.br
	{
.br
		// loop accross the matrix elements
.br
		// print each element
.br
		for(int i = 0; i < this.M; i++)
.br
		{
.br
			for(int j = 0; j < this.M; j++)
.br
			{
.br
				System.out.print(this.mat[i][j]+" ");
.br
			}
.br
			System.out.println();
.br
		}
.br
	}
.br

.br
	int unicodeSum()
.br
	{
.br
		// stores the sum of the corners of the mat
.br
		int sum = 0;
.br

.br
		// adding all the corners of the matrix
.br
		sum += this.mat[0][0] + this.mat[M-1][0] + this.mat[0][M-1] + this.mat[M-1][M-1];
.br

.br
		// returning the recorded sum
.br
		return sum;
.br
	}
.br

.br
	void rotateMat()
.br
	{
.br
		// rotated matrix
.br
		char[][] rot_mat = new char[this.M][this.M];
.br

.br
		// loop through the coloums from first to last
.br
		// loop through the rows from last to first
.br
		// rotate the mat matrix
.br
		for(int i = 0; i < M; i++)
.br
		{
.br
			for(int j = 0; j < M; j++)
.br
			{
.br
				rot_mat[i][j] = this.mat[j][M-i-1];
.br
			}
.br
		}
.br

.br
		// setting original matrix to rotated matrix
.br
		this.mat = rot_mat;
.br
	}
.br

.br
	static Matrix readMat()
.br
	{
.br
		// create input handler
.br
		// input handler
.br
		Scanner sc = new Scanner(System.in);
.br

.br
		// accept size as input
.br
		// Input from the user about the size of matrix
.br
		int M = sc.nextInt();
.br

.br
		// matrix object for matrix operations
.br
		Matrix m = new Matrix(M);
.br

.br
		// loop through the matrix to generate the matrix by accepting input
.br
		for(int i = 0; i < M; i++)
.br
		{
.br
			for(int j = 0; j < M; j++)
.br
			{
.br
				m.mat[i][j] = sc.next().charAt(0);
.br
			}
.br
		}
.br

.br
		// return the generated matrix
.br
		return m;
.br
	}
.br

.br
	public static void main(String args[])
.br
	{
.br
		// accpting input from user
.br
		// Matrix object
.br
		Matrix m = readMat();
.br

.br
		// displaying original matrix
.br
		System.out.println("\nOriginal Matrix: ");
.br
		m.display();
.br

.br
		// displaying the sum of the corners
.br
		System.out.println("\nSum = "+m.unicodeSum());
.br

.br
		// roatate the actual matrix
.br
		m.rotateMat();
.br

.br
		// display the rotated matrix
.br
		System.out.println("\nFinal Matrix: ");
.br
		m.display();
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
M|T{
 stores the size of square matrix
T}|int|Matrix
mat|T{
 stores the matrix itself
T}|char[][]|Matrix
sum|T{
 stores the sum of the corners of the mat
T}|int|unicodeSum
rot_mat|T{
 rotated matrix
T}|char[][]|rotateMat
sc|T{
 input handler
T}|Scanner|readMat
M|T{
 Input from the user about the size of matrix
T}|int|readMat
m|T{
 matrix object for matrix operations
T}|Matrix|readMat
m|T{
 Matrix object
T}|Matrix|main
.TE

.bp
.SH
.DS C
.LG
.LG
.LG
.B

Assignment 5

.NL
.DE
.LP
.br
Design a class StringModify in your default package that will contain two methods that will work on string
values. The method definitions of the class is given below:
.br

i) StringModify(String st): parameterized constructor
.br

ii) String insertStringAt(String w,int pos): to insert string w at valid position pos and returns final sentence
without changing any other data.
.br

iii) String deleteCharAt(char w,int pos): to delete character w from valid position pos and returns final
sentence without changing any other data.
.br

Write a possible menu in main method to implement the above logic for any random sentence by calling methods.
.br

DO POSSIBLE CHECKING WHERE REQUIRED.



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
.B StringModify
.br
Step 1:  Start
.br
Step 2:  initializes the original
.br
Step 3:  End
.br

.br
.B insertStringAt
.br
Step 1:  Start
.br
Step 2:  checks if pos is a valid position
.br
Step 3:  if not return null
.br
Step 4:  append w at pos in st
.br
Step 5:  use the + string concatination operator
.br
Step 6:  End
.br

.br
.B deleteCharAt
.br
Step 1:  Start
.br
Step 2:  checks if pos is a valid position
.br
Step 3:  if not return null
.br
Step 4:  checks if the char at pos is actually the required char
.br
Step 5:  if yes then it returns modifined string otherwise just the original string
.br
Step 6:  End
.br

.br
.B main
.br
Step 1:  Start
.br
Step 2:  accept menu entry option
.br
Step 3:  if the option is rediculous just return
.br
Step 4:  accept a sentence
.br
Step 5:  End

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
public class StringModify
.br
{
.br
	// original string
.br
	String st;
.br

.br
	StringModify(String st)
.br
	{
.br
		// initializes the original
.br
		this.st = st;
.br
	}
.br

.br
	String insertStringAt(String w, int pos)
.br
	{
.br
		// checks if pos is a valid position
.br
		// if not return null
.br

.br
		if(pos < 0 || pos >= this.st.length())
.br
			return null;
.br

.br
		// append w at pos in st
.br
		// use the + string concatination operator
.br
		
.br
		return this.st.substring(0, pos) + w + this.st.substring(pos);
.br
	}
.br

.br
	String deleteCharAt(char w, int pos)
.br
	{
.br
		// checks if pos is a valid position
.br
		// if not return null
.br

.br
		if(pos < 0 || pos >= this.st.length())
.br
			return null;
.br

.br
		// checks if the char at pos is actually the required char
.br
		// if yes then it returns modifined string otherwise just the original string
.br
		
.br
		return st.charAt(pos) == w ? this.st.substring(0, pos)+this.st.substring(pos+1) : this.st;
.br
	}
.br

.br
	public static void main(String args[])
.br
	{
.br
		// Input Handler
.br
		Scanner sc = new Scanner(System.in);
.br

.br
		// accept menu entry option
.br
		// option of menuentry
.br
		int opt = sc.nextInt();
.br

.br
		// if the option is rediculous just return
.br
		if(opt != 1 && opt != 2)
.br
			return;
.br

.br
		// accept a sentence
.br
		// generate an object of StringModify using that sentence
.br
		StringModify s = new StringModify(new Scanner(System.in).nextLine());
.br

.br
		// the new string that needs to be attached or removed
.br
		String w = sc.next();
.br

.br
		// position of the attachment or removal
.br
		int pos = sc.nextInt();
.br

.br
		switch(opt)
.br
		{
.br
			case 1:
.br
				System.out.println(s.insertStringAt(w, pos));
.br
				break;
.br

.br
			case 2:
.br
				System.out.println(s.deleteCharAt(w.charAt(0), pos));
.br
				break;
.br
		}
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
st|T{
 original string
T}|String|StringModify
sc|T{
 Input Handler
T}|Scanner|main
opt|T{
 option of menuentry
T}|int|main
s|T{
 generate an object of StringModify using that sentence
T}|StringModify|main
w|T{
 the new string that needs to be attached or removed
T}|String|main
pos|T{
 position of the attachment or removal
T}|int|main
.TE

.bp
.SH
.DS C
.LG
.LG
.LG
.B

Assignment 6

.NL
.DE
.LP
.br
Given two possible numbers M and N, such that M is between 100 and 10000 and N is less
than 100. Find the smallest integer that greater than M and whose digits add up to N. For
example, if M = 100 and N = 11, then the smallest integer greater than 100 whose digits add
up to 11 is 119
.br

Write a program to accept the numbers M and N from the user and print the smallest required
number whose sum of all its digits is equal to N. Also, print the total number of digits
presnet in the required number. The program should check for the validity of the inputs
display an appropriate message for an invalid input.
.br

Test your program with the sample data and some random data.
.br

Example 1
.br
INPUT:
.br
		M = 100
.br
		N = 11
.br
OUTPUT:
.br
		The required Number = 119
.br
		Total number of digits = 3
.br

Example 2
.br
INPUT:
.br
		M = 1500
.br
		N = 25
.br
OUTPUT:
.br
		The required Number = 1699
.br
		Total number of digits = 4
.br

Example 3
.br
INPUT:
.br
		M = 99
.br
		N = 11
.br
OUTPUT:
.br
		INVALID INPUT
.br
 


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
.B SumDigit
.br
Step 1:  Start
.br
Step 2:  initializing M with local M
.br
Step 3:  initializing N with local N
.br
Step 4:  End
.br

.br
.B digitSum
.br
Step 1:  Start
.br
Step 2:  create a duplicate of M
.br
Step 3:  while M is not 0 loop
.br
Step 4:  add all athe digits of M
.br
Step 5:  End
.br

.br
.B genNum
.br
Step 1:  Start
.br
Step 2:  check the value of M and N to make sure they are in range
.br
Step 3:  if not just return -1 to mark invalid input
.br
Step 4:  start a loop which to go from M till the upper bound
.br
Step 5:  check if any of the numbers is actually the required number
.br
Step 6:  if the number is found return the number of digits in the number
.br
Step 7:  store the number in M
.br
Step 8:  other wise return -1 marking an invalid input
.br
Step 9:  End
.br

.br
.B main
.br
Step 1:  Start
.br
Step 2:  accept input from the user
.br
Step 3:  use the input to initialize the object
.br
Step 4:  if the digit is -1 then it is invalid input
.br
Step 5:  End

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
public class SumDigit
.br
{
.br
	// lower bound of operations
.br
	int M;
.br

.br
	// the number to be derived from digits
.br
	int N;
.br

.br
	SumDigit(int M, int N)
.br
	{
.br
		// initializing M with local M
.br
		this.M = M;
.br

.br
		// initializing N with local N
.br
		this.N = N;
.br
	}
.br

.br
	int digitSum()
.br
	{
.br
		// create a duplicate of M
.br
		// local version of M for computation
.br
		int M = this.M;
.br

.br
		// stores the sum of digits
.br
		int sum = 0;
.br

.br
		// while M is not 0 loop
.br
		// add all athe digits of M
.br
		// return the added digits
.br
		while(M != 0)
.br
		{
.br
			sum += M%10;
.br
			M /= 10;
.br
		}
.br

.br
		return sum;
.br
	}
.br

.br
	int genNum()
.br
	{
.br
		int digits = -1;
.br

.br
		// check the value of M and N to make sure they are in range
.br
		// if not just return -1 to mark invalid input
.br
		if(this.M >= 10000 || this.M < 100 || this.N > 100)
.br
			return -1;
.br

.br
		// start a loop which to go from M till the upper bound
.br
		// check if any of the numbers is actually the required number
.br
		while(this.M < 10000)
.br
		{
.br
			if(digitSum() == this.N)
.br
			{
.br
				digits = (int)(Math.log10(this.M) + 1);
.br
				break;
.br
			}
.br
			this.M++;
.br
		}
.br

.br
		// if the number is found return the number of digits in the number
.br
		// store the number in M
.br
		// other wise return -1 marking an invalid input
.br
		return digits;
.br
	}
.br

.br
	public static void main(String args[])
.br
	{
.br
		// input handler
.br
		Scanner sc = new Scanner(System.in);
.br

.br
		// accept input from the user
.br
		// use the input to initialize the object
.br
		// call genNum and display the value
.br
		SumDigit s = new SumDigit(sc.nextInt(), sc.nextInt());
.br

.br
		//stores the digits
.br
		int digits = s.genNum();
.br

.br
		// if the digit is -1 then it is invalid input
.br
		if(digits == -1)
.br
		{
.br
			System.out.println("INVALID INPUT");
.br
		}
.br
		else
.br
		{
.br
			System.out.println("The required Number = "+s.M);
.br
			System.out.println("Total number of digits = "+digits);
.br
		}
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
M|T{
 lower bound of operations
T}|int|SumDigit
N|T{
 the number to be derived from digits
T}|int|SumDigit
M|T{
 local version of M for computation
T}|int|digitSum
sum|T{
 stores the sum of digits
T}|int|digitSum
digits|T{
 return the added digits
T}|int|genNum
sc|T{
 input handler
T}|Scanner|main
s|T{
 call genNum and display the value
T}|SumDigit|main
digits|T{
stores the digits
T}|int|main
.TE

.bp
.SH
.DS C
.LG
.LG
.LG
.B

Assignment 7

.NL
.DE
.LP
.br
Write a program to accetp a pragraph containing
.B TWO
senteces only. The sentences may be terminated by either '.', '?', or '!' only. Any other
character may be ignored. The words are to be separated by single blank space and must be
in UPPER CASE.
.br

Perform the following tasks:
.br
a) Check for the validity of the accepted paragraph for the number of sentecs and for the
terminating charater.
.br
b) Separate the two sentences from the paragraph and find common words in the two 
senteces with their frequency of occurence in the paragraph.
.br
c) Display both the sentences separately along with common words and their frequency, in
the format given below:
.br

Test your program for the following data and some random data:
.br

Example 1
.br
INPUT:
.br
		IS IT RAINING? YOU MAY GET WET IF IT IS RAINING.
.br

OUTPUT:
.br
		IS IT RAINING?
.br
		YOU MAY GET WET IF IT IS RAINING.
.br
		COMMON WORDS		FREQUENCY
.br
		IS			2
.br
		IT			2
.br
		RAINING			2
.br

Example 2
.br
INPUT:
.br
		ARE YOU COMMING? I AM GETTINNG LATE.
.br
OUTPUT:
.br
		ARE YOU COMMING?
.br
		I AM GETTINNG LATE.
.br

		NO COMMON WORDS
.br
*


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
.B Sentences
.br
Step 1:  Start
.br
Step 2:  initializing the raw
.br
Step 3:  initializing sentences with the given criteria
.br
Step 4:  End
.br

.br
.B checkValidity
.br
Step 1:  Start
.br
Step 2:  check if there is exactly 2 sentences
.br
Step 3:  if not return false
.br
Step 4:  convert the raw input to upper case
.br
Step 5:  check if the upper cased string is exact match to the raw string
.br
Step 6:  if not return false
.br
Step 7:  if all conditions pass return true
.br
Step 8:  End
.br

.br
.B findWordFrequency
.br
Step 1:  Start
.br
Step 2:  gets the number of occurence of the particular word
.br
Step 3:  loop through the local raw until no more words are left
.br
Step 4:  check if the word matches if so increment f
.br
Step 5:  return frequeny of words
.br
Step 6:  End
.br

.br
.B getCommonWord
.br
Step 1:  Start
.br
Step 2:  loop through the words
.br
Step 3:  if a match is encountered print the word
.br
Step 4:  return the generated output
.br
Step 5:  End
.br

.br
.B main
.br
Step 1:  Start
.br
Step 2:  accept input
.br
Step 3:  print the required value
.br
Step 4:  End

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
public class Sentences
.br
{
.br
	// sotres the actual raw input
.br
	String raw;
.br

.br
	// stores the 2 sentences
.br
	String[] sentences;
.br

.br
	Sentences(String raw)
.br
	{
.br
		// initializing the raw
.br
		this.raw = raw;
.br

.br
		// initializing sentences with the given criteria
.br
		this.sentences = raw.split("\\?|\\.|!");
.br
	}
.br

.br
	boolean checkValidity()
.br
	{
.br
		// check if there is exactly 2 sentences
.br
		// if not return false
.br
		if(this.sentences.length != 2)
.br
			return false;
.br

.br
		// convert the raw input to upper case
.br
		// check if the upper cased string is exact match to the raw string
.br
		// if not return false
.br
		if(!this.raw.toUpperCase().equals(this.raw))
.br
			return false;
.br

.br
		// if all conditions pass return true
.br
		return true;
.br
	}
.br

.br
	int findWordFrequency(String word)
.br
	{
.br
		// stores the frequency of words
.br
		int f = 0;
.br

.br
		// the raw paragraph with a space at the end
.br
		String raw = this.sentences[0]+" "+this.sentences[1]+" ";
.br

.br
		// stores the words present in raw
.br
		String[] words = raw.split(" ");
.br

.br
		// gets the number of occurence of the particular word
.br
		// loop through the local raw until no more words are left
.br
		// check if the word matches if so increment f
.br
		for(String w : words)
.br
		{
.br
			if(word.equals(w))
.br
			{
.br
				f++;
.br
			}
.br
		}
.br

.br
		// return frequeny of words
.br
		return f;
.br
	}
.br

.br
	String getCommonWord()
.br
	{
.br
		// the raw paragraph with a space at the end
.br
		String raw = this.sentences[0]+" "+this.sentences[1]+" ";
.br

.br
		// generate the words for the sentences
.br
		String[] words1 = this.sentences[0].split(" ");
.br

.br
		// generate the words for the sentences
.br
		String[] words2 = this.sentences[1].split(" ");
.br

.br
		// generated common words formated output
.br
		String x = "";
.br

.br
		// loop through the words
.br
		// if a match is encountered print the word
.br
		for(String w1 : words1)
.br
		{
.br
			for(String w2 : words2)
.br
			{
.br
				if(w1.equals(w2))
.br
				{
.br
					x += w1 + "\t\t"+ findWordFrequency(w1)+"\n";
.br
					break;
.br
				}
.br
			}
.br
		}
.br

.br
		// return the generated output
.br
		return x;
.br
	}
.br

.br
	public static void main(String args[])
.br
	{
.br
		// input handler
.br
		Scanner sc = new Scanner(System.in);
.br

.br
		// setnece object
.br
		Sentences se = new Sentences(sc.nextLine());
.br
		
.br
		// composited output
.br
		String x = se.getCommonWord();
.br

.br
		// accept input
.br
		// print the required value
.br
		if(x.equals(""))
.br
		{
.br
			System.out.println("NO COMMON WORDS");
.br
		}
.br
		else
.br
		{
.br
			System.out.println(se.sentences[0].trim()+se.raw.charAt(se.sentences[0].length()));
.br
			System.out.println(se.sentences[1].trim()+se.raw.trim().charAt(se.raw.trim().length()-1));
.br
			System.out.println("\nCOMMON WORDS\tFREQUENCY");
.br
			System.out.println(x);
.br
		}
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
raw|T{
 sotres the actual raw input
T}|String|Sentences
sentences|T{
 stores the 2 sentences
T}|String[]|Sentences
f|T{
 stores the frequency of words
T}|int|findWordFrequency
raw|T{
 the raw paragraph with a space at the end
T}|String|findWordFrequency
words|T{
 stores the words present in raw
T}|String[]|findWordFrequency
raw|T{
 the raw paragraph with a space at the end
T}|String|getCommonWord
words1|T{
 generate the words for the sentences
T}|String[]|getCommonWord
words2|T{
 generate the words for the sentences
T}|String[]|getCommonWord
x|T{
 generated common words formated output
T}|String|getCommonWord
sc|T{
 input handler
T}|Scanner|main
se|T{
 setnece object
T}|Sentences|main
x|T{
 composited output
T}|String|main
.TE

.bp
.SH
.DS C
.LG
.LG
.LG
.B

Assignment 8

.NL
.DE
.LP
.br
A class Mix has been defined to mix two words, character by character, in the following
manner:
.br
The first character of the first word is followed by the first character of the second word and
so on. If the words are of different length, the remaining characters of the longer word are
put at the end.
.br

Example: If the First word is "JUMP" and the second word is "STROLL", then the required word will be "JSUTMRPOLL"
.br

Some of the memebers of the class are given below:
.br

.B "Class Name"
	:	
.B "Mix"
.br

.B "Data member/instance variable:"
.br
	wrd		:	to store a word
.br
	len		:	to store a word
.br
.B "Memeber functions/methods:"
.br
.TS
expand tab(|);
l l s.
.br
Mix()|T{
:  default constructor to initialize
   the data members with legal initial value
T}
.br
void feedword()|T{
:  to accept the word in UPPER case
T}
.br
void mix_word(Mix P, Mix Q)|T{
:  mixes the words of object P and Q as
   stated above stores the resultant
   word in the current object
T}
.br
void display()|T{
:  display the word
T}
.TE
.br

Specify the class Mix giving the details of the constructor(), void feedword(), void mix_word(Mix, Mix)
and void display(). Define the main() function to create objects and call the functions accordingly
to enable the task.
.br
 


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
.B Mix
.br
Step 1:  Start
.br
Step 2:  Initialize values to default values
.br
Step 3:  initializing wrd with ""
.br
Step 4:  initializing len with 0
.br
Step 5:  End
.br

.br
.B feedword
.br
Step 1:  Start
.br
Step 2:  accept a singular word
.br
Step 3:  store the word in wrd
.br
Step 4:  check if the word is upper case
.br
Step 5:  if no kill the program
.br
Step 6:  otherwise initialize len
.br
Step 7:  End
.br

.br
.B mix_word
.br
Step 1:  Start
.br
Step 2:  loop throught the letter of P and Q until a boundary of the smaller is hit
.br
Step 3:  take the remaing value of P if any and add them to the wrd
.br
Step 4:  take the remaing value of Q if any and add them to the wrd
.br
Step 5:  correct the value of len
.br
Step 6:  End
.br

.br
.B display
.br
Step 1:  Start
.br
Step 2:  display the value of the word
.br
Step 3:  End
.br

.br
.B main
.br
Step 1:  Start
.br
Step 2:  accept input for P and Q
.br
Step 3:  call mix_word function to execute operation
.br
Step 4:  display computed value
.br
Step 5:  End

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
public class Mix
.br
{
.br
	// to store a word
.br
	String wrd;
.br

.br
	// to sotre the length of the word
.br
	int len;
.br

.br
	Mix()
.br
	{
.br
		// Initialize values to default values
.br
		// initializing wrd with ""
.br
		this.wrd = "";
.br

.br
		// initializing len with 0
.br
		this.len = 0;
.br
	}
.br

.br
	void feedword()
.br
	{
.br
		// accept a singular word
.br
		// input handler
.br
		Scanner sc = new Scanner(System.in);
.br

.br
		// store the word in wrd
.br
		this.wrd = sc.next();
.br

.br
		// check if the word is upper case
.br
		// if no kill the program
.br
		if(!this.wrd.toUpperCase().equals(this.wrd))
.br
			System.exit(1);
.br

.br
		// otherwise initialize len
.br
		this.len = this.wrd.length();
.br
	}
.br

.br
	void mix_word(Mix P, Mix Q)
.br
	{
.br
		// loop throught the letter of P and Q until a boundary of the smaller is hit
.br
		while(this.len < P.len && this.len < Q.len)
.br
		{
.br
			this.wrd += ""+P.wrd.charAt(this.len)+Q.wrd.charAt(this.len);
.br
			this.len++;
.br
		}
.br

.br
		// take the remaing value of P if any and add them to the wrd
.br
		if(this.len < P.len)
.br
			this.wrd += P.wrd.substring(this.len);
.br

.br
		// take the remaing value of Q if any and add them to the wrd
.br
		if(this.len < Q.len)
.br
			this.wrd += Q.wrd.substring(this.len);
.br

.br
		// correct the value of len
.br
		this.len = this.wrd.length();
.br
	}
.br

.br
	void display()
.br
	{
.br
		// display the value of the word
.br
		System.out.println(this.wrd);
.br
	}
.br

.br
	public static void main(String args[])
.br
	{
.br
		// P in the mix_word
.br
		Mix P = new Mix();
.br

.br
		// Q in the mix_word
.br
		Mix Q = new Mix();
.br

.br
		// the mix object for computation
.br
		Mix m = new Mix();
.br

.br
		// accept input for P and Q
.br
		P.feedword();
.br
		Q.feedword();
.br

.br
		// call mix_word function to execute operation
.br
		m.mix_word(P, Q);
.br

.br
		// display computed value
.br
		m.display();
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
wrd|T{
 to store a word
T}|String|Mix
len|T{
 to sotre the length of the word
T}|int|Mix
sc|T{
 input handler
T}|Scanner|feedword
P|T{
 P in the mix_word
T}|Mix|main
Q|T{
 Q in the mix_word
T}|Mix|main
m|T{
 the mix object for computation
T}|Mix|main
.TE

.bp
.SH
.DS C
.LG
.LG
.LG
.B

Assignment 9

.NL
.DE
.LP
.br
Q9) Design a class FiboPrime which will display all the the Fibonacci numbers upto n terms which have
atleast one prime digit in the number. For example 2,3,5,13,21 are some of the examples of Fibonacci
numbers having atleast one prime digit in it.
.br

Class name: FiboPrime
.br

Data members:
.br
n: number of terms
.br

Method:
.br
FiboPrime(int): constructor
.br

int fibo(int n): returns nth Fibonacci number
.br

void displayFiboPrimes(): Display all the Fibonacci numbers upto n terms which have
atleast one digit as prime
.br

boolean isPrime(int p): returns true or false if p is either prime or not.
.br

You can add method(s) if required.



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
.B FiboPrime
.br
Step 1:  Start
.br
Step 2:  initializing fibo prime using n
.br
Step 3:  End
.br

.br
.B fibo
.br
Step 1:  Start
.br
Step 2:  loop until n is zero
.br
Step 3:  set a = a+b
.br
Step 4:  and b = a-b
.br
Step 5:  return b as the nth fibo number
.br
Step 6:  End
.br

.br
.B isPrime
.br
Step 1:  Start
.br
Step 2:  if p is 1 then its not prime
.br
Step 3:  loop through numbers starting from 2 till p
.br
Step 4:  if anyone is divisible by p return flase
.br
Step 5:  if all the conditions fail then it must be true
.br
Step 6:  End
.br

.br
.B hasPrime
.br
Step 1:  Start
.br
Step 2:  loop throught the digits of a number
.br
Step 3:  if a prime number is found return true
.br
Step 4:  otherwise return false
.br
Step 5:  End
.br

.br
.B displayFiboPrimes
.br
Step 1:  Start
.br
Step 2:  loop through all the fibo numbers until n terms
.br
Step 3:  if a prime fibo is encountered print it
.br
Step 4:  End
.br

.br
.B main
.br
Step 1:  Start
.br
Step 2:  create an object using user input
.br
Step 3:  call displayFiboPrimes using that object
.br
Step 4:  End

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
public class FiboPrime
.br
{
.br
	// number of terms
.br
	int n;
.br

.br
	FiboPrime(int n)
.br
	{
.br
		// initializing fibo prime using n
.br
		this.n = n;
.br
	}
.br

.br
	int fibo(int n)
.br
	{
.br
		// second fibo number
.br
		int a = 1;
.br

.br
		// first fibo number
.br
		int b = 0;
.br

.br
		// loop until n is zero
.br
		// set a = a+b
.br
		// and b = a-b
.br
		while(n != 0)
.br
		{
.br
			a = a+b;
.br
			b = a-b;
.br
			n--;
.br
		}
.br

.br
		// return b as the nth fibo number
.br
		return b;
.br
	}
.br

.br
	boolean isPrime(int p)
.br
	{
.br
		// if p is 1 then its not prime
.br
		if(p == 1) return false;
.br

.br
		// iterator from 2 until p
.br
		int i = 2;
.br

.br
		// loop through numbers starting from 2 till p
.br
		// if anyone is divisible by p return flase
.br
		while(i != p)
.br
		{
.br
			if(p % i == 0)
.br
				return false;
.br
			i++;
.br
		}
.br

.br
		// if all the conditions fail then it must be true
.br
		return true;
.br
	}
.br

.br
	boolean hasPrime(int p)
.br
	{
.br
		// loop throught the digits of a number
.br
		// if a prime number is found return true
.br
		// otherwise return false
.br
		while(p != 0)
.br
		{
.br
			if(isPrime(p%10))
.br
				return true;
.br
			p/=10;
.br
		}
.br

.br
		return false;
.br
	}
.br

.br
	void displayFiboPrimes()
.br
	{
.br
		// iterator from 1 to n 
.br
		int i = 1;
.br

.br
		// fibo accumulator
.br
		int fb = 1;
.br

.br
		// loop through all the fibo numbers until n terms
.br
		// if a prime fibo is encountered print it
.br
		while(i < n)
.br
		{
.br
			fb = fibo(i);
.br
			if(hasPrime(fb))
.br
				System.out.println(fb);
.br
			i++;
.br
		}
.br
	}
.br

.br
	public static void main(String args[])
.br
	{
.br
		// Input handler
.br
		Scanner sc = new Scanner(System.in);
.br

.br
		// create an object using user input
.br
		// call displayFiboPrimes using that object
.br
		new FiboPrime(sc.nextInt()).displayFiboPrimes();
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
n|T{
 number of terms
T}|int|FiboPrime
a|T{
 second fibo number
T}|int|fibo
b|T{
 first fibo number
T}|int|fibo
i|T{
 iterator from 2 until p
T}|int|isPrime
i|T{
 iterator from 1 to n 
T}|int|displayFiboPrimes
fb|T{
 fibo accumulator
T}|int|displayFiboPrimes
sc|T{
 Input handler
T}|Scanner|main
.TE

.bp
.SH
.DS C
.LG
.LG
.LG
.B

Assignment 10

.NL
.DE
.LP
.br
Write a program to declare a matrix A[][] having order MxN( where M is no. of rows and N is no. of columns)
where values of both M and N must be greater than 2 and less than 10.Allow the user to accept value for matrix.
Perform the following tasks:
.br
a) Display original matrix
.br
b) Sort each odd row of the matrix in descending order using bubble sort algorithm and each even row of the matrix
in ascending order using selection sort algorithm.
.br
c) Display the final updated matrix.
.br
 


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
.B MxN
.br
Step 1:  Start
.br
Step 2:  initializing A with a new matrix
.br
Step 3:  initializing rows and cols
.br
Step 4:  End
.br

.br
.B bsort
.br
Step 1:  Start
.br
Step 2:  loop through the arr
.br
Step 3:  check if any element is smaller is than the next element
.br
Step 4:  if it is then swap the elements
.br
Step 5:  End
.br

.br
.B ssort
.br
Step 1:  Start
.br
Step 2:  loop through the arr
.br
Step 3:  check if any element is bigger than the currently selected element
.br
Step 4:  End
.br

.br
.B sort
.br
Step 1:  Start
.br
Step 2:  loop through the rows
.br
Step 3:  sort the loops according to ther index
.br
Step 4:  if odd send them to bsort
.br
Step 5:  else send them to ssort
.br
Step 6:  this would sort the matrix
.br
Step 7:  End
.br

.br
.B display
.br
Step 1:  Start
.br
Step 2:  using an iterative forloop print all the values
.br
Step 3:  print a newline at the end of line
.br
Step 4:  End
.br

.br
.B main
.br
Step 1:  Start
.br
Step 2:  creating object of MxN
.br
Step 3:  take input from stdin
.br
Step 4:  display original matrix
.br
Step 5:  sort the original in the fation metioned matrix
.br
Step 6:  display the sorted matrix
.br
Step 7:  End

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
public class MxN
.br
{
.br
	// Original Matrix
.br
	int[][] A;
.br

.br
	// number of rows
.br
	int M;
.br
	
.br
	// number of cols
.br
	int N;
.br

.br
	MxN(int M, int N)
.br
	{
.br
		// initializing A with a new matrix
.br
		this.A = new int[M][N];
.br

.br
		// initializing rows and cols
.br
		this.M = M;
.br
		this.N = N;
.br
	}
.br

.br
	void bsort(int[] arr)
.br
	{
.br
		// iterator
.br
		int i = 0;
.br

.br
		// internal iterator
.br
		int j = 0;
.br

.br

.br
		// loop through the arr
.br
		// check if any element is smaller is than the next element
.br
		// if it is then swap the elements
.br
		while(i < arr.length)
.br
		{
.br
			j = i;
.br
			while(j < arr.length-1)
.br
			{
.br
				if(arr[j+1] > arr[j])
.br
				{
.br
					// bubble sort arry element stuck
.br
					int x = arr[j+1];
.br
					arr[j+1] = arr[j];
.br
					arr[j] = x;
.br
				}
.br
				j++;
.br
			}
.br
			i++;
.br
		}
.br
	}
.br

.br
	void ssort(int[] arr)
.br
	{
.br
		// iterator
.br
		int i = 0;
.br

.br
		// internal iterator
.br
		int j = 0;
.br

.br
		// minimum number index
.br
		int jmin = 0;
.br

.br
		// loop through the arr
.br
		// check if any element is bigger than the currently selected element
.br
		// if it is then swap the elements
.br
		while(i < arr.length)
.br
		{
.br
			j = 0;
.br
			jmin = 0;
.br

.br
			while(j < arr.length)
.br
			{
.br
				if(arr[i] < arr[jmin])
.br
				{
.br
					jmin = j;
.br
				}
.br
				j++;
.br
			}
.br

.br
			int x = arr[i];
.br
			arr[i] = arr[jmin];
.br
			arr[jmin] = x;
.br

.br
			i++;
.br
		}
.br
	}
.br

.br
	void sort()
.br
	{
.br
		// iterator
.br
		int i = 0;
.br

.br
		// loop through the rows
.br
		// sort the loops according to ther index
.br
		// if odd send them to bsort
.br
		// else send them to ssort
.br
		// this would sort the matrix
.br
		while(i < M)
.br
		{
.br
			if((i+1) % 2 == 0)
.br
				ssort(this.A[i]);
.br
			else
.br
				bsort(this.A[i]);
.br
			i++;
.br
		}
.br
	}
.br

.br
	void display()
.br
	{
.br
		// index of the rows
.br
		int i = 0;
.br

.br
		// index of the cols
.br
		int j = 0;
.br

.br
		// using an iterative forloop print all the values
.br
		// print a newline at the end of line
.br
		while(i < M)
.br
		{
.br
			j = 0;
.br
			while(j < N)
.br
			{
.br
				System.out.print(j+" ");
.br
				j++;
.br
			}
.br
			System.out.println();
.br
			i++;
.br
		}
.br
	}
.br

.br
	public static void main(String args[])
.br
	{
.br
		// input handler
.br
		Scanner sc = new Scanner(System.in);
.br

.br
		// creating object of MxN
.br
		// object of MxN
.br
		MxN m = new MxN(sc.nextInt(), sc.nextInt());
.br

.br
		// row iterator
.br
		int i = 0;
.br

.br
		// col iterator
.br
		int j = 0;
.br

.br
		// take input from stdin
.br
		for(i = 0; i < m.M; i++)
.br
		{
.br
			for(j = 0; j < m.N; j++)
.br
			{
.br
				m.A[i][j] = sc.nextInt();
.br
			}
.br
		}
.br

.br
		// display original matrix
.br
		m.display();
.br

.br
		// sort the original in the fation metioned matrix
.br
		m.sort();
.br

.br
		// display the sorted matrix
.br
		m.display();
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
A|T{
 Original Matrix
T}|int[][]|MxN
M|T{
 number of rows
T}|int|MxN
N|T{
 number of cols
T}|int|MxN
i|T{
 iterator
T}|int|bsort
j|T{
 internal iterator
T}|int|bsort
x|T{
 bubble sort arry element stuck
T}|int|if
i|T{
 iterator
T}|int|ssort
j|T{
 internal iterator
T}|int|ssort
jmin|T{
 minimum number index
T}|int|ssort
x|T{
 if it is then swap the elements
T}|int|while
i|T{
 iterator
T}|int|sort
i|T{
 index of the rows
T}|int|display
j|T{
 index of the cols
T}|int|display
sc|T{
 input handler
T}|Scanner|main
m|T{
 object of MxN
T}|MxN|main
i|T{
 row iterator
T}|int|main
j|T{
 col iterator
T}|int|main
.TE

.bp
.SH
.DS C
.LG
.LG
.LG
.B

Assignment 11

.NL
.DE
.LP
.br
A superclass Binary has been defined to accept a binary number and a subclass ToHex has been defined to
convert binary number into its equivalent hexadecimal number using short cut logic of combining bits. Some of the
members of the class are given below:
.br

Class name : Binary
.br

Data members
.br
n : stores the binary number
.br

Member functions:
.br
BinHex(int n) : constructor to initialize the data member
.br
void display(): display the binary number
.br

Class name: ToHex
.br

Data member:
.br
hex: to store hexadecimal number
.br

Methods:
.br
ToHex(...): parameterized constructor
.br
void bin_hex() : calculates the hexadecimal equivalent of n and stores it in hex.( using short cut logic of combining bits)
.br
void display() : displays the binary number and hexadecimal number. You can add any extra methods if required.
.br
Using concept of inheritance write details of both the classes and write main method accordingly.
.br
*


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
.B BinHex
.br
Step 1:  Start
.br
Step 2:  initialize n using local n
.br
Step 3:  End
.br

.br
.B display
.br
Step 1:  Start
.br
Step 2:  loop through n digits
.br
Step 3:  when n is zero exit
.br
Step 4:  print each digit of number
.br
Step 5:  display a new line at the end for pretty print
.br
Step 6:  End
.br

.br
.B ToHex
.br
Step 1:  Start
.br
Step 2:  initialize super object
.br
Step 3:  hexnumber version of n
.br
Step 4:  End
.br

.br
.B bin_hex
.br
Step 1:  Start
.br
Step 2:  until n is zero loop
.br
Step 3:  generate a number from binary encoded decimal number
.br
Step 4:  attaching the number after generation to the hex value
.br
Step 5:  remove 4 digits from the end of n
.br
Step 6:  End
.br

.br
.B display
.br
Step 1:  Start
.br
Step 2:  calling super's display function
.br
Step 3:  a character mapper is used for prining
.br
Step 4:  loop through n digits base 16
.br
Step 5:  when n is zero exit
.br
Step 6:  print each digit of number
.br
Step 7:  display a subtle newline at the end
.br
Step 8:  End
.br

.br
.B main
.br
Step 1:  Start
.br
Step 2:  object is generated using user input
.br
Step 3:  execute bin_hex
.br
Step 4:  display the usable information
.br
Step 5:  End

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
class BinHex
.br
{
.br
	// stores the binary number
.br
	int n;
.br

.br
	BinHex(int n)
.br
	{
.br
		// initialize n using local n
.br
		this.n = n;
.br
	}
.br

.br
	void display()
.br
	{
.br
		// local version of n
.br
		int n = this.n;
.br

.br
		// output number
.br
		String output = "";
.br

.br
		// loop through n digits
.br
		// when n is zero exit
.br
		// print each digit of number
.br
		while(n != 0)
.br
		{
.br
			output = n%10 + output;
.br
			n /= 10;
.br
		}
.br

.br
		// display a new line at the end for pretty print
.br
		System.out.println(output);
.br
	}
.br
}
.br

.br
public class ToHex extends BinHex
.br
{
.br
	// to store hexadecimal number
.br
	int hex;
.br

.br
	ToHex(int n)
.br
	{
.br
		// initialize super object
.br
		super(n);
.br

.br
		// hexnumber version of n
.br
		this.hex = 0;
.br
	}
.br

.br
	void bin_hex()
.br
	{
.br
		// local copy of n
.br
		int n = super.n;
.br

.br
		// shift register
.br
		int shl = 0;
.br

.br
		// until n is zero loop
.br
		// generate a number from binary encoded decimal number
.br
		// attaching the number after generation to the hex value
.br
		// remove 4 digits from the end of n
.br
		while(n != 0)
.br
		{
.br
			// decoded binary encoded decimal
.br
			int number = (((n % 10000)/1000) << 3) |
.br
				(((n % 1000)/100) << 2) |
.br
				(((n % 100)/10) << 1) |
.br
				(n % 10);
.br

.br
			this.hex = this.hex | (number << shl);
.br

.br
			n /= 10000;
.br
			shl += 4;
.br
		}
.br
	}
.br

.br
	void display()
.br
	{
.br
		// calling super's display function
.br
		super.display();
.br

.br
		// output number
.br
		String output = "";
.br

.br
		// a character mapper is used for prining
.br
		// a hex character mapper
.br
		char[] hex_map = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};
.br

.br
		// loop through n digits base 16
.br
		// when n is zero exit
.br
		// print each digit of number
.br
		while(hex != 0)
.br
		{
.br
			output = hex_map[hex%16] + output;
.br
			hex /= 16;
.br
		}
.br

.br
		// display a subtle newline at the end
.br
		System.out.println(output);
.br
	}
.br

.br
	public static void main(String arg[])
.br
	{
.br
		// input handler
.br
		Scanner sc = new Scanner(System.in);
.br

.br
		// object is generated using user input
.br
		// to hex object
.br
		ToHex th = new ToHex(sc.nextInt());
.br

.br
		// execute bin_hex
.br
		th.bin_hex();
.br

.br
		// display the usable information
.br
		th.display();
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
n|T{
 stores the binary number
T}|int|BinHex
n|T{
 local version of n
T}|int|display
output|T{
 output number
T}|String|display
hex|T{
 to store hexadecimal number
T}|int|BinHex
n|T{
 local copy of n
T}|int|bin_hex
shl|T{
 shift register
T}|int|bin_hex
number|T{
 decoded binary encoded decimal
T}|int|while
output|T{
 output number
T}|String|display
hex_map|T{
 a hex character mapper
T}|char[]|display
sc|T{
 input handler
T}|Scanner|main
th|T{
 to hex object
T}|ToHex|main
.TE

.bp
.SH
.DS C
.LG
.LG
.LG
.B

Assignment 12

.NL
.DE
.LP
.br
A super class Sentence accepts a sentence in uppercase terminated by ‘.’ only.
A subclass Encrypt will
encrypt the words in the sentence with a valid logic given below.
.br

Class name: Sentence
.br

Data members:
.br
sen: accepts a sentence in uppercase and terminated by ‘.’ only.
Words in the sentence can be separated by one or more spaces.
.br

Methods:
.br
Sentence(String): constructor
.br
void show(): update the sentence where each word will be separated by single space
and terminated by ‘.’.
Display the updated sentence.
.br

Class name: Encrypt
.br

Data member:
.br
nsen: stores encrypted sentence
.br

Methods:
.br
Encrypt(...): constructor
.br
void encrypt(): encrypt the words in the updated sentence
as per logic given below:
.br
i)
For the word(s) starting with vowel, write the vowel then append consecutive consonants and
vowels present in the word. Example say if the word is EXAMINATION then encrypted word will
be EXAMINATINO
.br
ii)
For the word(s) starting with consonant, arrange the characters in the word in descending order
as per ASCII value. Example say if the word is CONSTANT then encrypted word will be
TTSONNCA.
.br
Finally create the encrypted sentence with encrypted word terminated by ‘.’
.br
void show(): display updated original and encrypted sentence.
.br
*


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
.B Sentence
.br
Step 1:  Start
.br
Step 2:  initialize the sentence
.br
Step 3:  End
.br

.br
.B show
.br
Step 1:  Start
.br
Step 2:  display sen
.br
Step 3:  End
.br

.br
.B Encrypt
.br
Step 1:  Start
.br
Step 2:  initializing super class by sending original sentence
.br
Step 3:  initialize null sting for nsen
.br
Step 4:  End
.br

.br
.B encrypt
.br
Step 1:  Start
.br
Step 2:  split the sentence into ' '
.br
Step 3:  remove the '.' at the end becuase its of no use
.br
Step 4:  iterate over the words
.br
Step 5:  if the word starts with vowel
.br
Step 6:  then attach vowels and consonats one after another
.br
Step 7:  otherwise sort the whole chars in desending order
.br
Step 8:  bubble sort the chars
.br
Step 9:  End
.br

.br
.B show
.br
Step 1:  Start
.br
Step 2:  call the super show function
.br
Step 3:  display the encrypted sentence
.br
Step 4:  End
.br

.br
.B main
.br
Step 1:  Start
.br
Step 2:  test if the line ends with '.'
.br
Step 3:  if not nuke the program
.br
Step 4:  encrypt text supplied
.br
Step 5:  show the encrpyted text
.br
Step 6:  End

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
class Sentence
.br
{
.br
	// actual sentence
.br
	String sen;
.br

.br
	Sentence(String sen)
.br
	{
.br
		// initialize the sentence
.br
		this.sen = sen;
.br
	}
.br

.br
	void show()
.br
	{
.br
		// display sen
.br
		System.out.println(this.sen);
.br
	}
.br
}
.br

.br
public class Encrypt extends Sentence
.br
{
.br
	// stores encrypted sentence
.br
	String nsen;
.br

.br
	Encrypt(String sen)
.br
	{
.br
		// initializing super class by sending original sentence
.br
		super(sen);
.br

.br
		// initialize null sting for nsen
.br
		this.nsen = "";
.br
	}
.br

.br
	void encrypt()
.br
	{
.br
		// split the sentence into ' '
.br
		// remove the '.' at the end becuase its of no use
.br
		// words of the sentence ladies and gentle men
.br
		String[] words = super.sen.substring(0, super.sen.length()-1).split(" ");
.br

.br
		// words iterator controler
.br
		int i = 0;
.br

.br
		// iterate over the words
.br
		// if the word starts with vowel
.br
		// then attach vowels and consonats one after another
.br
		// otherwise sort the whole chars in desending order
.br
		// bubble sort the chars
.br
		// if word length is 1 then dont do anything just attach the word
.br
		while(i < words.length)
.br
		{
.br
			if(words[i].length() == 1)
.br
			{
.br
				this.nsen += words[i] + " ";
.br
			}
.br
			else if("aeiouAEIOU".indexOf(words[i].charAt(0)) >= 0)
.br
			{
.br
				// list of vowels
.br
				String vowels = "";
.br

.br
				// list of consonants
.br
				String consonants = "";
.br

.br
				// iterator j
.br
				int j = 0;
.br
				while(j < words[i].length())
.br
				{
.br
					if("aeiouAEIOU".indexOf(words[i].charAt(j)) >= 0)
.br
					{
.br
						vowels += words[i].charAt(j);
.br
					}
.br
					else
.br
					{
.br
						consonants += words[i].charAt(j);
.br
					}
.br
					j++;
.br
				}
.br

.br
				j = 0;
.br
				while(j < vowels.length() && j < consonants.length())
.br
				{
.br
					this.nsen += vowels.charAt(j);
.br
					this.nsen += consonants.charAt(j);
.br
					j++;
.br
				}
.br

.br
				if(j < vowels.length())
.br
					this.nsen += vowels.substring(j);
.br

.br
				if(j < consonants.length())
.br
					this.nsen += consonants.substring(j);
.br

.br
				this.nsen += " ";
.br
			}
.br
			else
.br
			{
.br
				char[] letters = words[i].toCharArray();
.br

.br
				// iterator k
.br
				int k = 0;
.br

.br
				// iterator l
.br
				int l = 0;
.br

.br
				for(k = 0; k < letters.length; k++)
.br
				{
.br
					for(l = 0; l < letters.length-1; l++)
.br
					{
.br
						if(letters[l] < letters[l+1])
.br
						{
.br
							// duplicate letters
.br
							char x = letters[l];
.br
							letters[l] = letters[l+1];
.br
							letters[l+1] = x;
.br
						}
.br
					}
.br
				}
.br

.br
				this.nsen += new String(letters);
.br

.br
				this.nsen += " ";
.br
			}
.br
			i++;
.br
		}
.br
		this.nsen += ".";
.br
	}
.br

.br
	void show()
.br
	{
.br
		// call the super show function
.br
		super.show();
.br

.br
		// display the encrypted sentence
.br
		System.out.println(this.nsen);
.br
	}
.br

.br
	public static void main(String args[])
.br
	{
.br
		// input handler
.br
		Scanner sc = new Scanner(System.in);
.br

.br
		// line input
.br
		String line = sc.nextLine();
.br

.br
		// test if the line ends with '.'
.br
		// if not nuke the program
.br
		if(line.charAt(line.length()-1) != '.')
.br
			return;
.br

.br
		// encrypt object creation
.br
		Encrypt e = new Encrypt(line);
.br

.br
		// encrypt text supplied
.br
		e.encrypt();
.br

.br
		// show the encrpyted text
.br
		e.show();
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
sen|T{
 actual sentence
T}|String|Sentence
nsen|T{
 stores encrypted sentence
T}|String|Sentence
words|T{
 words of the sentence ladies and gentle men
T}|String[]|encrypt
i|T{
 words iterator controler
T}|int|encrypt
vowels|T{
 list of vowels
T}|String|if
consonants|T{
 list of consonants
T}|String|if
j|T{
 iterator j
T}|int|if
letters|T{
 if word length is 1 then dont do anything just attach the word
T}|char[]|else
k|T{
 iterator k
T}|int|else
l|T{
 iterator l
T}|int|else
x|T{
 duplicate letters
T}|char|if
sc|T{
 input handler
T}|Scanner|main
line|T{
 line input
T}|String|main
e|T{
 encrypt object creation
T}|Encrypt|main
.TE

.bp
.SH
.DS C
.LG
.LG
.LG
.B

Assignment 13

.NL
.DE
.LP
.br
A superclass Number is defined to accept number of terms and also calculate the factorial of a
number. Define a subclass Series to find the product of the series
.br
P = x * x2/3! * x4/4! * x8/5! * x16/6! ......... n terms
.br
The details of the members of both classes are given below:
.br

Class name: Number
.br

Data member/instance variable:
.br
n: to store an integer number
.br

Member functions/methods:
.br
Number(int): constructor to initialize the data member
.br
int factorial(int a): returns the factorial of a number(use recursion)
.br
(factorial of n(n!) = 1 × 2 × 3 × …… × n)
.br
void display(): displays the value of n
.br

Class name: Series
.br

Data member/instance variable:
.br
prod: to store the product of the series
.br
x: accepts value of unknown variable x(in double)
.br

Member functions/methods:
.br
Series(…) : parameterized constructor to initialize the data members of both the classes
.br
void calProd(): calculates the PRODUCT of the given series
.br
void display(): displays the data members of both the classes
.br
*


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
.B Number
.br
Step 1:  Start
.br
Step 2:  initialize the value of n using local value
.br
Step 3:  End
.br

.br
.B factorial
.br
Step 1:  Start
.br
Step 2:  if a == 1 return a
.br
Step 3:  if that is not the case multiply a with the return value of factorial(a-1)
.br
Step 4:  End
.br

.br
.B display
.br
Step 1:  Start
.br
Step 2:  print the value of n
.br
Step 3:  End
.br

.br
.B Series
.br
Step 1:  Start
.br
Step 2:  initialize the super class object
.br
Step 3:  initialize the local value of x
.br
Step 4:  initialize prod to 1 (-_-)
.br
Step 5:  End
.br

.br
.B calProd
.br
Step 1:  Start
.br
Step 2:  loop using the iterator
.br
Step 3:  generate the product using the fomulae provided
.br
Step 4:  End
.br

.br
.B display
.br
Step 1:  Start
.br
Step 2:  call super's display function
.br
Step 3:  print the product of the value
.br
Step 4:  End
.br

.br
.B main
.br
Step 1:  Start
.br
Step 2:  generates the series from user input
.br
Step 3:  calculate the product
.br
Step 4:  display the product
.br
Step 5:  End

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
class Number
.br
{
.br
	// to store an integer number
.br
	int n;
.br

.br
	Number(int n)
.br
	{
.br
		// initialize the value of n using local value
.br
		this.n = n;
.br
	}
.br

.br
	int factorial(int a)
.br
	{
.br
		// if a == 1 return a
.br
		if(a == 1) return a;
.br

.br
		// if that is not the case multiply a with the return value of factorial(a-1)
.br
		return a * factorial(a-1);
.br
	}
.br

.br
	void display()
.br
	{
.br
		// print the value of n
.br
		System.out.println(this.n);
.br
	}
.br
}
.br

.br
public class Series extends Number
.br
{
.br
	// to store the product of the series
.br
	int prod;
.br

.br
	// accepts value of unknown variable x(in double)
.br
	int x;
.br

.br
	Series(int n, int x)
.br
	{
.br
		// initialize the super class object
.br
		super(n);
.br

.br
		// initialize the local value of x
.br
		this.x = x;
.br

.br
		// initialize prod to 1 (-_-)
.br
		this.prod = 1;
.br
	}
.br

.br
	void calProd()
.br
	{
.br
		// create an iterator
.br
		int i = 1;
.br

.br
		// loop using the iterator
.br
		// generate the product using the fomulae provided
.br
		while(i <= n)
.br
		{
.br
			this.prod *= Math.pow(x, i)/factorial(i);
.br
		}
.br
	}
.br

.br
	void display()
.br
	{
.br
		// call super's display function
.br
		super.display();
.br
		
.br
		// print the product of the value
.br
		System.out.println(this.prod);
.br
	}
.br

.br
	public static void main(String args[])
.br
	{
.br
		// input handler
.br
		Scanner sc = new Scanner(System.in);
.br

.br
		// generates the series from user input
.br
		// series object
.br
		Series s = new Series(sc.nextInt(), sc.nextInt());
.br

.br
		// calculate the product
.br
		s.calProd();
.br

.br
		// display the product
.br
		s.display();
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
n|T{
 to store an integer number
T}|int|Number
prod|T{
 to store the product of the series
T}|int|Number
x|T{
 accepts value of unknown variable x(in double)
T}|int|Number
i|T{
 create an iterator
T}|int|calProd
sc|T{
 input handler
T}|Scanner|main
s|T{
 series object
T}|Series|main
.TE

.bp

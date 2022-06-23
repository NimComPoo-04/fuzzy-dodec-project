

.nr PS 12500
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
	
.br
}
.br
import java.util.Scanner;
.br
public class TimeAdd_main
.br
{
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
|T{

T}||
.TE

.bp

/**
Assignment 2.

Write a program to add two times given by the user in hour,min and seconds.


Class name: TimeAdd


Data member: hr(hour),min(minutes),sec(seconds)


Member methods:

TimeAdd(): DEFAULT constructor

void accept(): accept time from user

TimeAdd timeAdd(TimeAdd t): add two time objects return the final time value.

*/

import java.util.Scanner;

public class TimeAdd
{
	int hr;		// hours
	int min;	// minuites
	int sec;	// second

	public TimeAdd()
	{
		// initialize the time
		this.hr = 0;
		this.min = 0;
		this.sec = 0;
	}

	void accept()
	{
		// input handler
		Scanner sc = new Scanner(System.in);

		// accept input from the user
		this.hr = sc.nextInt();
		this.min = sc.nextInt();
		this.sec = sc.nextInt();

		// check if mins are between 0 and 60
		if(this.min >= 60 || this.min < 0)
		{
			System.err.println("Minuites make no sense!");
			System.exit(1);
		}

		// check if mins are between 0 and 60
		if(this.sec >= 60 || this.sec < 0)
		{
			System.err.println("Seconds make no sense!");
			System.exit(1);
		}
	}

	TimeAdd timeAdd(TimeAdd t)
	{
		// add two time objects return final value
		// generate a new timeadd object
		// add and store the value of this and t

		TimeAdd x = new TimeAdd();

		x.sec = t.sec + this.sec;
		x.min = t.min + this.min + x.sec/60;
		x.hr = t.hr + this.hr + x.min/60;

		x.sec = x.sec % 60;
		x.min = x.min % 60;

		return x;
	}

	void display()
	{
		// display time in hour, mins and seconds
		System.out.println("Hr: "+this.hr+" Min:"+this.min+" Sec: "+this.sec);
	}

	public static void main(String args[])
	{
		// 3 value of Timeadd
		// Timeadds
		TimeAdd[] t = new TimeAdd[]{new TimeAdd(), new TimeAdd(), null};

		// accept values for t's
		t[0].accept();
		t[1].accept();

		// add time objects
		t[2] = t[0].timeAdd(t[1]);

		// display the times
		t[0].display();
		t[1].display();
		t[2].display();
	}
}

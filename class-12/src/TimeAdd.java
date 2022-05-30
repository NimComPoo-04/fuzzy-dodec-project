import java.util.Scanner;

public class TimeAdd
{
	int hr;		// hours
	int min;	// minuites
	int sec;	// second

	public TimeAdd()
	{
		this.hr = 0;
		this.min = 0;
		this.sec = 0;
	}

	// accepts time from the user
	void accept()
	{
		Scanner sc = new Scanner(System.in);

		System.out.print("Enter hours: ");
		this.hr = sc.nextInt();

		System.out.print("Enter minuites: ");
		this.min = sc.nextInt();

		System.out.print("Enter seconds: ");
		this.sec = sc.nextInt();

		if(this.min >= 60 || this.min < 0)
		{
			System.err.println("Minuites make no sense!");
			System.exit(1);
		}
		if(this.sec >= 60 || this.sec < 0)
		{
			System.err.println("Seconds make no sense!");
			System.exit(1);
		}
	}

	// add two time objects return final value
	TimeAdd timeAdd(TimeAdd t)
	{
		TimeAdd x = new TimeAdd();
		x.hr = t.hr + this.hr;
		x.min = t.min + this.min;
		x.sec = t.sec + this.sec;
		return x;
	}

	// display time in hour, mins and seconds
	void display()
	{
		System.out.println("Hr: "+this.hr+"Min:"+this.min+" Sec: "+this.sec);
	}

	public static void main(String args[])
	{
		TimeAdd t[] = new TimeAdd[]{new TimeAdd(), new TimeAdd(), null};

		t[0].accept();
		t[1].accept();

		t[2] = t[0].timeAdd(t[1]);

		t[0].display();
		t[1].display();
		t[2].display();
	}
}

import java.util.Scanner;
public class TimeAdd_main
{
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

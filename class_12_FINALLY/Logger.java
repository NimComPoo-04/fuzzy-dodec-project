import java.util.Scanner;

public class Logger
{
	// id of the user
	int id;

	// longin information stores in minuites
	long login_time;
	long login_date;		// stores in days

	// logout information stores in minuites
	long logout_time;
	long logout_date;

	final static int months[] = {0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

	// initializing logger
	public Logger(int id, long t1, long t2, long d1, long d2)
	{
		this.id = id;

		this.login_time = t1;
		this.logout_time = t2;

		this.login_date = d1;
		this.logout_date = d2;
	}

	// time difference in minuites
	long time_diff()
	{
		long days = this.logout_date - this.login_date;
		long time = this.logout_time - this.login_time;

		return days * 24 * 60 + time;
	}

	// displays the system in format
	void output()
	{
		if(id == -1)
		{
			System.out.print("--INVALID--");
			return;
		}

		System.out.print(id+"\t\t");
		System.out.print((login_time/60)+":"+(login_time%60)+"\t");
		System.out.print(revert_month(login_date)+"\t\t");
		System.out.print((logout_time/60)+":"+(logout_time%60)+"\t");
		System.out.print(revert_month(logout_date)+"\t\t");
		System.out.print((time_diff()/60)+":"+(time_diff()%60));
	}

	// revert the number to month
	static String revert_month(long days)
	{
		int i = 0;

		for(; days - months[i] > 0; i++)
			days -= months[i];

		return days+"-"+i;
	}

	// get the days from the months
	static long get_month(int days, int month)
	{
		long sum = days;
		for(int i = 0; i < month; i++)
			sum += months[i];
		return sum;
	}

	// creates a logger object from input
	static Logger input(Scanner sc)
	{
		int id = 0;

		long i = 0;
		long j = 0;

		long I = 0;
		long J = 0;

		// parses input
		try
		{
			String x[] = sc.next().split(" ");
			id = Integer.parseInt(x[0]);

			String y[] = sc.next().split(":");
			i = Integer.parseInt(y[0]) * 60 + Integer.parseInt(y[1]);

			String Y[] = sc.next().split("-");
			I = get_month(Integer.parseInt(Y[0]), Integer.parseInt(Y[1]));

			String z[] = sc.next().split(":");
			j = Integer.parseInt(z[0]) * 60 + Integer.parseInt(z[1]);

			String Z[] = sc.next().split("-");
			J = get_month(Integer.parseInt(Z[0]), Integer.parseInt(Z[1]));
		}
		catch(NumberFormatException e)
		{
			System.out.println("MALFORMED INPUT");
			return new Logger(-1, 0, 0, 0, 0);
		}
		finally
		{
			return new Logger(id, i, j, I, J);
		}
	}

	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in);

		System.out.print("Number of Users: ");
		int number = sc.nextInt();
		Logger l[] = new Logger[number];

		System.out.println();

		// INPUT

		System.out.println("USER\t\tLOGIN\t\tLOGOUT");
		System.out.println("IDENTIFICATION\tTIME & DATE\tTIME & DATE");
		for(int i = 0; i < number; i++)
		{
			l[i] = input(sc);
		}


		// OUTPUT
		Logger good = l[0];

		System.out.println("USER\t\tLOGIN\t\tLOGOUT");
		System.out.println("IDENTIFICATION\tTIME & DATE\tTIME & DATE\tHOURS:MINS");
		for(int i = 0; i < number; i++)
		{
			l[i].output();
			System.out.println();

			if(l[i].time_diff() > good.time_diff())
				good = l[i];
		}
		System.out.println("THE USER LOGGED IN FOR THE LONGEST DURATION");
		good.output();
		System.out.println();
	}
}

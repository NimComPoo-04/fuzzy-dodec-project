package ps1;

import java.util.Scanner;

public class problem_6
{
	static double lrg(double a[])
	{
		double k = a[0];
		for(double d : a)
			k = Math.max(k, d);
		return k;
	}

	static double sum(double a[])
	{
		double k = 0;
		for(double d : a)
			k += d;
		return k;
	}

	static double avg(double a[])
	{
		return sum(a)/a.length;
	}

	static double std(double a[])
	{
		double s = 0;
		double avg = avg(a);

		for(double d : a)
			s += Math.pow(d - avg, 2);
		s /= a.length - 1;
		return Math.sqrt(s);
	}

	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in);

		System.out.print("Enter number of data-points: ");
		double a[] = new double[sc.nextInt()];

		System.out.print("Enter the data-points: ");
		for(int i = 0; i < a.length; i++)
			a[i] = sc.nextDouble();

		System.out.println("Largest            = " + lrg(a));
		System.out.println("Sum                = " + sum(a));
		System.out.println("Avarage            = " + avg(a));
		System.out.println("Standard Deviation = " + std(a));
	}
}

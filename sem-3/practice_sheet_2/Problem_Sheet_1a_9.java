package ps2;

import java.util.Scanner;

class Student
{
	private String name;
	private byte roll;
	private byte p1_score;
	private byte p2_score;
	private byte p3_score;

	Student(String name, byte roll, byte p1, byte p2, byte p3)
	{
		this.name = name;
		this.roll = roll;
		this.p1_score = p1;
		this.p2_score = p2;
		this.p3_score = p3;
	}

	int getTotal()
	{
		int actual = (p1_score + p2_score + p3_score);
		byte min = (byte)Math.min(Math.min(p1_score, p2_score), p3_score);

		return actual - min;
	}

	double getAverage()
	{
		return getTotal() / 2.0;
	}

	String getDivision()
	{
		int total = getTotal();
		double average = getAverage();

		if(p1_score < 40 && p2_score < 40 && p3_score < 40)
			return "F";

		if(average >= 60.0)
			return "1";
		else if(average >= 50.0)
			return "2";
		else if(average >= 40.0)
			return "3";

		return "F";
	}

	public String toString()
	{
		String s = "";

		s += "Name    : " + name + "\n";
		s += "Roll No.: " + roll + "\n";
		s += "p1 score: " + p1_score + "\n";
		s += "p2 score: " + p2_score + "\n";
		s += "p3 score: " + p3_score + "\n";
		s += "Total   : " + getTotal() + "\n";
		s += "Average : " + getAverage() + "\n";
		s += "Division: " + getDivision() + "\n";

		return s;
	}
}

public class Problem_Sheet_1a_9
{
	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in);

		System.out.print("Enter Name: ");
		String name = sc.nextLine();

		System.out.print("Enter Roll: ");
		byte roll = sc.nextByte();

		System.out.print("Enter P1 score: ");
		byte p1 = sc.nextByte();

		System.out.print("Enter P2 score: ");
		byte p2 = sc.nextByte();

		System.out.print("Enter P2 score: ");
		byte p3 = sc.nextByte();

		Student s = new Student(name, roll, p1, p2, p3);
		System.out.println(s);
	}
}

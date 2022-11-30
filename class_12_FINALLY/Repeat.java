import java.util.Scanner;

public class Repeat
{
	int st[];	// buffer on data
	int cap;	// capacity of buffer
	int f;		// front
	int r;		// rear
	
	// Constructor for Repeat
	public Repeat(int cap)
	{
		this.st = new int[100];
		this.cap = cap;
		this.f = 0;
		this.r = 0;
	}

	// pushing value
	void pushvalue(int v)
	{
		if(this.r == this.cap)
		{
			System.out.println("OVERFLOW");
		}
		else
		{
			this.st[this.r++] = v;
		}
	}

	// pop the values lol
	int popvalue()
	{
		if(this.f == this.r)
			return -9999;
		else
			return this.st[this.f++];
	}

	// accept stuff 
	void accept(Scanner sc)
	{
		for(int i = 0; i < this.cap; i++)
			this.pushvalue(sc.nextInt());
	}

	// Display the elemnts present
	void disp()
	{
		System.out.print("{ ");
		for(int i = this.f; i < this.r; i++)
		{
			System.out.print(this.st[i]+" ");
		}
		System.out.println("}");
	}

	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in);

		System.out.print("Enter Capacity: ");
		int cap = sc.nextInt();

		Repeat r = new Repeat(cap);

		System.out.println("Enter Values: ");
		r.accept(sc);


		System.out.print("Enter Pop Value: ");
		t = sc.nextInt();

		String output = "{ ";

		for(int i = 0; i < t; i++)
			output += r.popvalue() + " ";

		output += "}";

		System.out.println("Popped: " + output);

		System.out.print("List: ");
		r.disp();
	}
}

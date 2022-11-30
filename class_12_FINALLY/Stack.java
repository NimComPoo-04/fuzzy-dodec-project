import java.util.Scanner;

public class Stack
{
	String st[];	// the array to hold the names
	int size;	// maximum capcity
	int top;	// top of stack
	int ctr;	// counter

	public Stack()
	{
		this.st = null;
		this.size = 0;
		this.top = 0;
		this.ctr = 0;
	}

	// Stack with capcity
	public Stack(int cap)
	{
		this.st = new String[cap];
		this.size = cap;
		this.top = -1;
		this.ctr = 0;
	}

	// push name onto stack
	void pushname(String n)
	{
		if(this.ctr == this.size)
			System.out.println("OVERFLOW");
		else
		{
			this.st[++this.top] = n;
			this.ctr++;
		}
	}

	// removes a name of the stack
	String popname()
	{
		if(this.ctr == 0)
		{
			System.out.println("UNDERFLOW");
			return "";
		}
		else
		{
			this.ctr--;
			return this.st[--this.top];
		}
	}

	// displays the stuff on the stack
	void display()
	{
		for(int i = 0; i < this.ctr; i++)
		{
			System.out.println(this.st[i]);
		}
	}

	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in);

		System.out.print("Enter Capacity: ");
		int cap = sc.nextInt();

		Stack r = new Stack(cap);

		System.out.print("Enter Push Names: ");
		int t = sc.nextInt();

		for(int i = 0; i < t; i++)
			r.pushname(sc.next());

		System.out.print("Enter Pop Names: ");
		t = sc.nextInt();

		String output = "{ ";

		for(int i = 0; i < t; i++)
			output += r.popname() + " ";

		output += "}";

		System.out.println("Popped: " + output);

		System.out.print("List: ");
		r.display();
	}
}

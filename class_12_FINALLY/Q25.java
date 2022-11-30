import java.util.Scanner;

public class Q25
{
	int digit;
	Q25 next;

	public Q25(int digit)
	{
		this.digit = digit;
		this.next = null;
	}

	// Display the number lol
	void display()
	{
		Q25 q = this;
		while(q != null)
		{
			System.out.print(q.digit + (q.next == null ? "" : ", "));
			q = q.next;
		}
		System.out.println();
	}

	// checks equality
	boolean equal(Q25 a)
	{
		Q25 b = this;

		// checks if numbers are equal
		while(b != null || a != null)
		{
			if(b.digit != a.digit)
				return false;
			a = a.next;
			b = b.next;
		}
		
		// if its not equal in length
		if(b != null || a != null)
			return false;

		// otherwise return true
		return true;
	}

	// builds a number into a linked list
	static Q25 buildNumber(int n)
	{
		Q25 head = new Q25(n%10);
		n /= 10;

		while(n != 0)
		{
			Q25 f = new Q25(n%10);
			f.next = head;
			head = f;
			n /= 10;
		}
		return head;
	}

	// takes input prints number
	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in);

		System.out.print("Give the first number: ");
		int x = sc.nextInt();

		System.out.print("Give the second number: ");
		int y = sc.nextInt();

		Q25 q = buildNumber(x);
		System.out.print("First Number: ");
		q.display();

		Q25 p = buildNumber(y);
		System.out.print("Second Number: ");
		p.display();

		System.out.println(q.equal(p) ? "Equal" : "UnequalInput");
	}
}

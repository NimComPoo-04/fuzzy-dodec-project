import java.util.Scanner;

public class Prime_Adam
{
	// primts prime adams
	void display(int n, int m)
	{
		if(n > m)
			System.out.println("INVALID INPUT");
		else
		{
			String s = "";
			int freq = 0;
			for(int i = n; i < m; i++)
			{
				if(isPrime(i) && isAdam(i))
				{
					s += i + " ";
					freq++;
				}
			}

			if(freq == 0)
			{
				s = "NIL";
			}

			System.out.println("THE PRIME-ADAM INTEGERS ARE: "+s);
			System.out.println("FREQUENCY OF PRIME-ADAM INTEGERS IS: "+freq);
		}
	}

	// check if thing is prime
	boolean isPrime(int i)
	{
		if(i == 1)
			return false;
		for(int x = 2; x < i; x++)
			if(i % x == 0)
				return false;
		return true;
	}

	// reverses the number
	int reverse(int x)
	{
		int y = 0;
		while(x != 0)
		{
			y = y * 10 + x%10;
			x /= 10;
		}
		return y;
	}

	// check if the thing is adam
	boolean isAdam(int i)
	{
		return i * i == reverse(reverse(i) * reverse(i));
	}

	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in);

		System.out.print("m = ");
		int m = sc.nextInt();
		System.out.print("n = ");
		int n = sc.nextInt();

		new Prime_Adam().display(m, n);
	}
}

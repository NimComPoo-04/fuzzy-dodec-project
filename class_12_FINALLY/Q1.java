import java.util.Scanner;

public class Q1
{
	int money;
	int length;
	int coins[];

	public Q1(int money, int length)
	{
		this.money = money;
		this.length = length;
		this.coins = new int[length];
	}

	void accept(Scanner sc)
	{
		for(int i = 0; i < this.length; i++)
		{
			this.coins[i] = sc.nextInt();
		}
	}

	int total_sum()
	{
		int sum = 0;
		for(int i = 0; i < this.length; i++)
		{
			sum += this.coins[i];
		}
		return sum;
	}

	int possible(int indx, int size, int k)
	{
		// This is fine since we will be checking the permiability at first in possible
		if(size >= this.length)
			return 0;

		for(int i = indx; i < this.length; i++)
		{
			int sum = 0;

			// adds up the combination
			for(int j = 0; j < size; j++)
			{
				sum += this.coins[(j+i)%this.length];
			}

			if(sum == k)
				return 1;

			// Since the oder of computation does not matter we will not bother with second loop
			if(possible(i, size+1, k) == 1)
				return 1;
		}

		return 0;
	}

	int possible()
	{
		// this equation is derived by rearranging the logic
		// total - k = money + k => (total - money)/2 = k
		int k = (total_sum() - money)/2;
		return possible(0, 1, k);
	}

	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in);
		int t = sc.nextInt();

		for(int i = 0; i < t; i++)
		{
			int x = sc.nextInt();
			int y = sc.nextInt();

			Q1 q = new Q1(y, x);
			q.accept(sc);
			System.out.println(q.possible());
		}
	}
}

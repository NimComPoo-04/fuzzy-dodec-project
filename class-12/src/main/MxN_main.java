import java.util.Scanner;
public class MxN_main
{
	public static void main(String args[])
	{
		// input handler
		Scanner sc = new Scanner(System.in);

		// creating object of MxN
		// object of MxN
		MxN m = new MxN(sc.nextInt(), sc.nextInt());

		// row iterator
		int i = 0;

		// col iterator
		int j = 0;

		// take input from stdin
		for(i = 0; i < m.M; i++)
		{
			for(j = 0; j < m.N; j++)
			{
				m.A[i][j] = sc.nextInt();
			}
		}
		System.out.println();

		// display original matrix
		m.display();
		System.out.println();

		// sort the original in the fation metioned matrix
		m.sort();

		// display the sorted matrix
		m.display();
	}
}

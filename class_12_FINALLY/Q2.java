import java.util.Scanner;

public class Q2
{
	int A[][];	// 2d array
	int row;	// rows
	int col;	// cols

	// Constructor
	public Q2(int row, int col)
	{
		this.row = row;
		this.col = col;
		this.A = new int[row][col];
	}

	// accept input
	void accept(Scanner sc)
	{
		for(int i = 0; i < this.row; i++)
		{
			for(int j = 0; j < this.col; j++)
			{
				this.A[i][j] = sc.nextInt();
			}
		}
	}

	// Sorting upwards
	void sort1d()
	{
		int d1[] = new int[this.row * this.col];

		// memory copy
		for(int i = 0; i < this.col; i++)
		{
			for(int j = 0; j < this.col; j++)
			{
				d1[i * this.row + j] = this.A[i][j];
			}
		}

		// sorting
		for(int i = 0; i < this.row * this.col; i++)
		{
			for(int j = 0; j < this.row * this.col-1; j++)
			{
				if(d1[j] > d1[j+1])
				{
					int t = d1[j];
					d1[j] = d1[j+1];
					d1[j+1] = t;
				}
			}
		}

		// memory copy
		for(int i = 0; i < this.row; i++)
		{
			for(int j = 0; j < this.col; j++)
			{
				 this.A[i][j] = d1[i * this.row + j];
			}
		}
	}

	// 2d sorting
	void sort2d()
	{
		// sorting
		for(int i = 0; i < this.row*this.col; i++)
		{
			for(int j = 0; j < this.row*this.col-1; j++)
			{
				if(this.A[j/this.row][j%this.row] > this.A[(j+1)/this.row][(j+1)%this.row])
				{
					int t = this.A[j/this.row][j%this.row];
					this.A[j/this.row][j%this.row] = this.A[(j+1)/this.row][(j+1)%this.row];
					this.A[(j+1)/this.row][(j+1)%this.row] = t;
				}
			}
		}
	}

	// Display
	void display()
	{
		for(int i = 0; i < this.row; i++)
		{
			for(int j = 0; j < this.col; j++)
			{
				System.out.print(this.A[i][j] + " ");
			}
			System.out.println();
		}
	}

	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in);

		System.out.println("Enter row and col: ");
		int row = sc.nextInt();
		int col = sc.nextInt();

		Q2 q = new Q2(row, col);

		System.out.println("\nEnter array for 1d sorting: ");
		q.accept(sc);
		System.out.println("\nsort1d: ");
		q.sort1d();
		q.display();

		System.out.println("\nEnter array for 2d sorting: ");
		q.accept(sc);
		System.out.println("\nsort2d: ");
		q.sort2d();
		q.display();
	}
}

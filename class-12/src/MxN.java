/**
Assignment 10.

Write a program to declare a matrix A[][] having order MxN( where M is no. of rows and N is no. of columns)
where values of both M and N must be greater than 2 and less than 10.Allow the user to accept value for matrix.
Perform the following tasks:

a) Display original matrix

b) Sort each odd row of the matrix in descending order using bubble sort algorithm and each even row of the matrix
in ascending order using selection sort algorithm.

c) Display the final updated matrix.

 */

import java.util.Scanner;

public class MxN
{
	// Original Matrix
	int[][] A;

	// number of rows
	int M;
	
	// number of cols
	int N;

	MxN(int M, int N)
	{
		// initializing A with a new matrix
		this.A = new int[M][N];

		// initializing rows and cols
		this.M = M;
		this.N = N;
	}

	void bsort(int[] arr)
	{
		// iterator
		int i = 0;

		// internal iterator
		int j = 0;


		// loop through the arr
		// check if any element is smaller is than the next element
		// if it is then swap the elements
		while(i < arr.length)
		{
			j = i;
			while(j < arr.length-1)
			{
				if(arr[j+1] > arr[j])
				{
					// bubble sort arry element stuck
					int x = arr[j+1];
					arr[j+1] = arr[j];
					arr[j] = x;
				}
				j++;
			}
			i++;
		}
	}

	void ssort(int[] arr)
	{
		// iterator
		int i = 0;

		// internal iterator
		int j = 0;

		// minimum number index
		int jmin = 0;

		// loop through the arr
		// check if any element is bigger than the currently selected element
		// if it is then swap the elements
		while(i < arr.length)
		{
			j = 0;
			jmin = 0;

			while(j < arr.length)
			{
				if(arr[i] < arr[jmin])
				{
					jmin = j;
				}
				j++;
			}

			int x = arr[i];
			arr[i] = arr[jmin];
			arr[jmin] = x;

			i++;
		}
	}

	void sort()
	{
		// iterator
		int i = 0;

		// loop through the rows
		// sort the loops according to ther index
		// if odd send them to bsort
		// else send them to ssort
		// this would sort the matrix
		while(i < M)
		{
			if((i+1) % 2 == 0)
				ssort(this.A[i]);
			else
				bsort(this.A[i]);
			i++;
		}
	}

	void display()
	{
		// index of the rows
		int i = 0;

		// index of the cols
		int j = 0;

		// using an iterative forloop print all the values
		// print a newline at the end of line
		while(i < M)
		{
			j = 0;
			while(j < N)
			{
				System.out.print(j+" ");
				j++;
			}
			System.out.println();
			i++;
		}
	}

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

		// display original matrix
		m.display();

		// sort the original in the fation metioned matrix
		m.sort();

		// display the sorted matrix
		m.display();
	}
}

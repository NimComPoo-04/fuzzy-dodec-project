/**
Assignment 4.

Write a program to accept a square matrix CIR[][] of order MXM where M is no. of rows and no. of columns. Value
of M varies from 2 <= M <= 10. Accept alphabet character values in UPPERCASE as input. Display appropriate mess
for invalid input. Perform following tasks.


i) Display Original Matrix.

ii) Find the sum of Unicode values of the elements of four corners of the matrix.

iii) Rotate matrix 90 degrees anti-clockwise and display it 


Example:


INPUT:

		M = 3


		A F D

		D B T

		C A A


OUTPUT:

		Original Matrix:

		A F D

		D B T

		C A A


		Sum = 256


		Final Matrix:

		D T A

		F B A

		A D C

 */

import java.util.Scanner;

public class Matrix
{
	// stores the size of square matrix
	int M;

	// stores the matrix itself
	char[][] mat;

	Matrix(int M)
	{
		// initializing M with M
		this.M = M;

		// initializing mat of size M by M
		this.mat = new char[M][M];
	}

	void display()
	{
		// loop accross the matrix elements
		// print each element
		for(int i = 0; i < this.M; i++)
		{
			for(int j = 0; j < this.M; j++)
			{
				System.out.print(this.mat[i][j]+" ");
			}
			System.out.println();
		}
	}

	int unicodeSum()
	{
		// stores the sum of the corners of the mat
		int sum = 0;

		// adding all the corners of the matrix
		sum += this.mat[0][0] + this.mat[M-1][0] + this.mat[0][M-1] + this.mat[M-1][M-1];

		// returning the recorded sum
		return sum;
	}

	void rotateMat()
	{
		// rotated matrix
		char[][] rot_mat = new char[this.M][this.M];

		// loop through the coloums from first to last
		// loop through the rows from last to first
		// rotate the mat matrix
		for(int i = 0; i < M; i++)
		{
			for(int j = 0; j < M; j++)
			{
				rot_mat[i][j] = this.mat[j][M-i-1];
			}
		}

		// setting original matrix to rotated matrix
		this.mat = rot_mat;
	}

	static Matrix readMat()
	{
		// create input handler
		// input handler
		Scanner sc = new Scanner(System.in);

		// accept size as input
		// Input from the user about the size of matrix
		int M = sc.nextInt();

		// matrix object for matrix operations
		Matrix m = new Matrix(M);

		// loop through the matrix to generate the matrix by accepting input
		for(int i = 0; i < M; i++)
		{
			for(int j = 0; j < M; j++)
			{
				m.mat[i][j] = sc.next().charAt(0);
			}
		}

		// return the generated matrix
		return m;
	}

	public static void main(String args[])
	{
		// accpting input from user
		// Matrix object
		System.out.println("Enter Matrix: ");
		Matrix m = Matrix.readMat();

		// displaying original matrix
		System.out.println("\nOriginal Matrix: ");
		m.display();

		// displaying the sum of the corners
		System.out.println("\nSum = "+m.unicodeSum());

		// roatate the actual matrix
		m.rotateMat();

		// display the rotated matrix
		System.out.println("\nFinal Matrix: ");
		m.display();
	}
}

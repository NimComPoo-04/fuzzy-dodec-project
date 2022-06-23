

.nr PS 12500
.SH
.DS C
.LG
.LG
.LG
.B

Assignment 4

.NL
.DE
.LP
.br
Write a program to accept a square matrix CIR[][] of order MXM where M is no. of rows and no. of columns. Value
of M varies from 2 <= M <= 10. Accept alphabet character values in UPPERCASE as input. Display appropriate mess
for invalid input. Perform following tasks.
.br

i) Display Original Matrix.
.br
ii) Find the sum of Unicode values of the elements of four corners of the matrix.
.br
iii) Rotate matrix 90 degrees anti-clockwise and display it 
.br

Example:
.br

INPUT:
.br
		M = 3
.br

		A F D
.br
		D B T
.br
		C A A
.br

OUTPUT:
.br
		Original Matrix:
.br
		A F D
.br
		D B T
.br
		C A A
.br

		Sum = 256
.br

		Final Matrix:
.br
		D T A
.br
		F B A
.br
		A D C
.br
 


.bp
.SH
.DS C
.LG
.LG
.B
Algorithm
.NL
.DE

.LP

.br

.br
.B Matrix
.br
Step 1:  Start
.br
Step 2:  initializing M with M
.br
Step 3:  initializing mat of size M by M
.br
Step 4:  End
.br

.br
.B display
.br
Step 1:  Start
.br
Step 2:  loop accross the matrix elements
.br
Step 3:  print each element
.br
Step 4:  End
.br

.br
.B unicodeSum
.br
Step 1:  Start
.br
Step 2:  adding all the corners of the matrix
.br
Step 3:  returning the recorded sum
.br
Step 4:  End
.br

.br
.B rotateMat
.br
Step 1:  Start
.br
Step 2:  loop through the coloums from first to last
.br
Step 3:  loop through the rows from last to first
.br
Step 4:  rotate the mat matrix
.br
Step 5:  setting original matrix to rotated matrix
.br
Step 6:  End
.br

.br
.B readMat
.br
Step 1:  Start
.br
Step 2:  create input handler
.br
Step 3:  accept size as input
.br
Step 4:  loop through the matrix to generate the matrix by accepting input
.br
Step 5:  return the generated matrix
.br
Step 6:  End
.br

.br
.B main
.br
Step 1:  Start
.br
Step 2:  accpting input from user
.br
Step 3:  displaying original matrix
.br
Step 4:  displaying the sum of the corners
.br
Step 5:  roatate the actual matrix
.br
Step 6:  display the rotated matrix
.br
Step 7:  End

.bp
.SH
.DS C
.LG
.LG
.B
Source Code
.NL
.DE
.LP
.SM
.fam C

.br

.br
import java.util.Scanner;
.br

.br
public class Matrix
.br
{
.br
	// stores the size of square matrix
.br
	int M;
.br

.br
	// stores the matrix itself
.br
	char[][] mat;
.br

.br
	Matrix(int M)
.br
	{
.br
		// initializing M with M
.br
		this.M = M;
.br

.br
		// initializing mat of size M by M
.br
		this.mat = new char[M][M];
.br
	}
.br

.br
	void display()
.br
	{
.br
		// loop accross the matrix elements
.br
		// print each element
.br
		for(int i = 0; i < this.M; i++)
.br
		{
.br
			for(int j = 0; j < this.M; j++)
.br
			{
.br
				System.out.print(this.mat[i][j]+" ");
.br
			}
.br
			System.out.println();
.br
		}
.br
	}
.br

.br
	int unicodeSum()
.br
	{
.br
		// stores the sum of the corners of the mat
.br
		int sum = 0;
.br

.br
		// adding all the corners of the matrix
.br
		sum += this.mat[0][0] + this.mat[M-1][0] + this.mat[0][M-1] + this.mat[M-1][M-1];
.br

.br
		// returning the recorded sum
.br
		return sum;
.br
	}
.br

.br
	void rotateMat()
.br
	{
.br
		// rotated matrix
.br
		char[][] rot_mat = new char[this.M][this.M];
.br

.br
		// loop through the coloums from first to last
.br
		// loop through the rows from last to first
.br
		// rotate the mat matrix
.br
		for(int i = 0; i < M; i++)
.br
		{
.br
			for(int j = 0; j < M; j++)
.br
			{
.br
				rot_mat[i][j] = this.mat[j][M-i-1];
.br
			}
.br
		}
.br

.br
		// setting original matrix to rotated matrix
.br
		this.mat = rot_mat;
.br
	}
.br

.br
	static Matrix readMat()
.br
	{
.br
		// create input handler
.br
		// input handler
.br
		Scanner sc = new Scanner(System.in);
.br

.br
		// accept size as input
.br
		// Input from the user about the size of matrix
.br
		int M = sc.nextInt();
.br

.br
		// matrix object for matrix operations
.br
		Matrix m = new Matrix(M);
.br

.br
		// loop through the matrix to generate the matrix by accepting input
.br
		for(int i = 0; i < M; i++)
.br
		{
.br
			for(int j = 0; j < M; j++)
.br
			{
.br
				m.mat[i][j] = sc.next().charAt(0);
.br
			}
.br
		}
.br

.br
		// return the generated matrix
.br
		return m;
.br
	}
.br

.br
	
.br
}
.br
import java.util.Scanner;
.br
public class Matrix_main
.br
{
.br
	public static void main(String args[])
.br
	{
.br
		// accpting input from user
.br
		// Matrix object
.br
		Matrix m = Matrix.readMat();
.br

.br
		// displaying original matrix
.br
		System.out.println("\nOriginal Matrix: ");
.br
		m.display();
.br

.br
		// displaying the sum of the corners
.br
		System.out.println("\nSum = "+m.unicodeSum());
.br

.br
		// roatate the actual matrix
.br
		m.rotateMat();
.br

.br
		// display the rotated matrix
.br
		System.out.println("\nFinal Matrix: ");
.br
		m.display();
.br
	}
.br
}
.br

.fam
.NL

.bp
.SH
.DS C
.LG
.LG
.B
Varible Listing
.NL
.DE

.LP
.TS
expand center tab(|);
- - - - -
|cb |cb s| cb |cb|
- - - - -
|l |l s| l |l|.
Name|Function|Type|Scope
M|T{
 stores the size of square matrix
T}|int|Matrix
mat|T{
 stores the matrix itself
T}|char[][]|Matrix
sum|T{
 stores the sum of the corners of the mat
T}|int|unicodeSum
rot_mat|T{
 rotated matrix
T}|char[][]|rotateMat
sc|T{
 input handler
T}|Scanner|readMat
M|T{
 Input from the user about the size of matrix
T}|int|readMat
m|T{
 matrix object for matrix operations
T}|Matrix|readMat
|T{

T}||
.TE

.bp

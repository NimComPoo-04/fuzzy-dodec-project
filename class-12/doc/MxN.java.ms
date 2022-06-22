

.nr PS 12500
.SH
.DS C
.LG
.LG
.LG
.B

Assignment 10

.NL
.DE
.LP
.br
Write a program to declare a matrix A[][] having order MxN( where M is no. of rows and N is no. of columns)
where values of both M and N must be greater than 2 and less than 10.Allow the user to accept value for matrix.
Perform the following tasks:
.br
a) Display original matrix
.br
b) Sort each odd row of the matrix in descending order using bubble sort algorithm and each even row of the matrix
in ascending order using selection sort algorithm.
.br
c) Display the final updated matrix.
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
.B MxN
.br
Step 1:  Start
.br
Step 2:  initializing A with a new matrix
.br
Step 3:  initializing rows and cols
.br
Step 4:  End
.br

.br
.B bsort
.br
Step 1:  Start
.br
Step 2:  loop through the arr
.br
Step 3:  check if any element is smaller is than the next element
.br
Step 4:  if it is then swap the elements
.br
Step 5:  End
.br

.br
.B ssort
.br
Step 1:  Start
.br
Step 2:  loop through the arr
.br
Step 3:  check if any element is bigger than the currently selected element
.br
Step 4:  End
.br

.br
.B sort
.br
Step 1:  Start
.br
Step 2:  loop through the rows
.br
Step 3:  sort the loops according to ther index
.br
Step 4:  if odd send them to bsort
.br
Step 5:  else send them to ssort
.br
Step 6:  this would sort the matrix
.br
Step 7:  End
.br

.br
.B display
.br
Step 1:  Start
.br
Step 2:  using an iterative forloop print all the values
.br
Step 3:  print a newline at the end of line
.br
Step 4:  End
.br

.br
.B main
.br
Step 1:  Start
.br
Step 2:  creating object of MxN
.br
Step 3:  take input from stdin
.br
Step 4:  display original matrix
.br
Step 5:  sort the original in the fation metioned matrix
.br
Step 6:  display the sorted matrix
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
public class MxN
.br
{
.br
	// Original Matrix
.br
	int[][] A;
.br

.br
	// number of rows
.br
	int M;
.br
	
.br
	// number of cols
.br
	int N;
.br

.br
	MxN(int M, int N)
.br
	{
.br
		// initializing A with a new matrix
.br
		this.A = new int[M][N];
.br

.br
		// initializing rows and cols
.br
		this.M = M;
.br
		this.N = N;
.br
	}
.br

.br
	void bsort(int[] arr)
.br
	{
.br
		// iterator
.br
		int i = 0;
.br

.br
		// internal iterator
.br
		int j = 0;
.br

.br

.br
		// loop through the arr
.br
		// check if any element is smaller is than the next element
.br
		// if it is then swap the elements
.br
		while(i < arr.length)
.br
		{
.br
			j = i;
.br
			while(j < arr.length-1)
.br
			{
.br
				if(arr[j+1] > arr[j])
.br
				{
.br
					// bubble sort arry element stuck
.br
					int x = arr[j+1];
.br
					arr[j+1] = arr[j];
.br
					arr[j] = x;
.br
				}
.br
				j++;
.br
			}
.br
			i++;
.br
		}
.br
	}
.br

.br
	void ssort(int[] arr)
.br
	{
.br
		// iterator
.br
		int i = 0;
.br

.br
		// internal iterator
.br
		int j = 0;
.br

.br
		// minimum number index
.br
		int jmin = 0;
.br

.br
		// loop through the arr
.br
		// check if any element is bigger than the currently selected element
.br
		// if it is then swap the elements
.br
		while(i < arr.length)
.br
		{
.br
			j = 0;
.br
			jmin = 0;
.br

.br
			while(j < arr.length)
.br
			{
.br
				if(arr[i] < arr[jmin])
.br
				{
.br
					jmin = j;
.br
				}
.br
				j++;
.br
			}
.br

.br
			int x = arr[i];
.br
			arr[i] = arr[jmin];
.br
			arr[jmin] = x;
.br

.br
			i++;
.br
		}
.br
	}
.br

.br
	void sort()
.br
	{
.br
		// iterator
.br
		int i = 0;
.br

.br
		// loop through the rows
.br
		// sort the loops according to ther index
.br
		// if odd send them to bsort
.br
		// else send them to ssort
.br
		// this would sort the matrix
.br
		while(i < M)
.br
		{
.br
			if((i+1) % 2 == 0)
.br
				ssort(this.A[i]);
.br
			else
.br
				bsort(this.A[i]);
.br
			i++;
.br
		}
.br
	}
.br

.br
	void display()
.br
	{
.br
		// index of the rows
.br
		int i = 0;
.br

.br
		// index of the cols
.br
		int j = 0;
.br

.br
		// using an iterative forloop print all the values
.br
		// print a newline at the end of line
.br
		while(i < M)
.br
		{
.br
			j = 0;
.br
			while(j < N)
.br
			{
.br
				System.out.print(j+" ");
.br
				j++;
.br
			}
.br
			System.out.println();
.br
			i++;
.br
		}
.br
	}
.br

.br
	public static void main(String args[])
.br
	{
.br
		// input handler
.br
		Scanner sc = new Scanner(System.in);
.br

.br
		// creating object of MxN
.br
		// object of MxN
.br
		MxN m = new MxN(sc.nextInt(), sc.nextInt());
.br

.br
		// row iterator
.br
		int i = 0;
.br

.br
		// col iterator
.br
		int j = 0;
.br

.br
		// take input from stdin
.br
		for(i = 0; i < m.M; i++)
.br
		{
.br
			for(j = 0; j < m.N; j++)
.br
			{
.br
				m.A[i][j] = sc.nextInt();
.br
			}
.br
		}
.br

.br
		// display original matrix
.br
		m.display();
.br

.br
		// sort the original in the fation metioned matrix
.br
		m.sort();
.br

.br
		// display the sorted matrix
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
A|T{
 Original Matrix
T}|int[][]|MxN
M|T{
 number of rows
T}|int|MxN
N|T{
 number of cols
T}|int|MxN
i|T{
 iterator
T}|int|bsort
j|T{
 internal iterator
T}|int|bsort
x|T{
 bubble sort arry element stuck
T}|int|if
i|T{
 iterator
T}|int|ssort
j|T{
 internal iterator
T}|int|ssort
jmin|T{
 minimum number index
T}|int|ssort
x|T{
 if it is then swap the elements
T}|int|while
i|T{
 iterator
T}|int|sort
i|T{
 index of the rows
T}|int|display
j|T{
 index of the cols
T}|int|display
sc|T{
 input handler
T}|Scanner|main
m|T{
 object of MxN
T}|MxN|main
i|T{
 row iterator
T}|int|main
j|T{
 col iterator
T}|int|main
.TE

.bp

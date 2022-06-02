.SH
.DS C
.LG
.LG
.LG
.B

Assignment 6

.NL
.DE
.LP
.br
Given two possible numbers M and N, such that M is between 100 and 10000 and N is less
than 100. Find the smallest integer that greater than M and whose digits add up to N. For
example, if M = 100 and N = 11, then the smallest integer greater than 100 whose digits add
up to 11 is 119
.br

Write a program to accept the numbers M and N from the user and print the smallest required
number whose sum of all its digits is equal to N. Also, print the total number of digits
presnet in the required number. The program should check for the validity of the inputs
display an appropriate message for an invalid input.
.br

Test your program with the sample data and some random data.
.br

Example 1
.br
INPUT:
.br
		M = 100
.br
		N = 11
.br
OUTPUT:
.br
		The required Number = 119
.br
		Total number of digits = 3
.br

Example 2
.br
INPUT:
.br
		M = 1500
.br
		N = 25
.br
OUTPUT:
.br
		The required Number = 1699
.br
		Total number of digits = 4
.br

Example 3
.br
INPUT:
.br
		M = 99
.br
		N = 11
.br
OUTPUT:
.br
		INVALID INPUT
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
.B SumDigit
.br
Step 1:  Start
.br
Step 2:  initializing M with local M
.br
Step 3:  initializing N with local N
.br
Step 4:  End
.br

.br
.B digitSum
.br
Step 1:  Start
.br
Step 2:  create a duplicate of M
.br
Step 3:  while M is not 0 loop
.br
Step 4:  add all athe digits of M
.br
Step 5:  End
.br

.br
.B genNum
.br
Step 1:  Start
.br
Step 2:  check the value of M and N to make sure they are in range
.br
Step 3:  if not just return -1 to mark invalid input
.br
Step 4:  start a loop which to go from M till the upper bound
.br
Step 5:  check if any of the numbers is actually the required number
.br
Step 6:  if the number is found return the number of digits in the number
.br
Step 7:  store the number in M
.br
Step 8:  other wise return -1 marking an invalid input
.br
Step 9:  End
.br

.br
.B main
.br
Step 1:  Start
.br
Step 2:  accept input from the user
.br
Step 3:  use the input to initialize the object
.br
Step 4:  if the digit is -1 then it is invalid input
.br
Step 5:  End

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
public class SumDigit
.br
{
.br
	// lower bound of operations
.br
	int M;
.br

.br
	// the number to be derived from digits
.br
	int N;
.br

.br
	SumDigit(int M, int N)
.br
	{
.br
		// initializing M with local M
.br
		this.M = M;
.br

.br
		// initializing N with local N
.br
		this.N = N;
.br
	}
.br

.br
	int digitSum()
.br
	{
.br
		// create a duplicate of M
.br
		// local version of M for computation
.br
		int M = this.M;
.br

.br
		// stores the sum of digits
.br
		int sum = 0;
.br

.br
		// while M is not 0 loop
.br
		// add all athe digits of M
.br
		// return the added digits
.br
		while(M != 0)
.br
		{
.br
			sum += M%10;
.br
			M /= 10;
.br
		}
.br

.br
		return sum;
.br
	}
.br

.br
	int genNum()
.br
	{
.br
		int digits = -1;
.br

.br
		// check the value of M and N to make sure they are in range
.br
		// if not just return -1 to mark invalid input
.br
		if(this.M >= 10000 || this.M < 100 || this.N > 100)
.br
			return -1;
.br

.br
		// start a loop which to go from M till the upper bound
.br
		// check if any of the numbers is actually the required number
.br
		while(this.M < 10000)
.br
		{
.br
			if(digitSum() == this.N)
.br
			{
.br
				digits = (int)(Math.log10(this.M) + 1);
.br
				break;
.br
			}
.br
			this.M++;
.br
		}
.br

.br
		// if the number is found return the number of digits in the number
.br
		// store the number in M
.br
		// other wise return -1 marking an invalid input
.br
		return digits;
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
		// accept input from the user
.br
		// use the input to initialize the object
.br
		// call genNum and display the value
.br
		SumDigit s = new SumDigit(sc.nextInt(), sc.nextInt());
.br

.br
		//stores the digits
.br
		int digits = s.genNum();
.br

.br
		// if the digit is -1 then it is invalid input
.br
		if(digits == -1)
.br
		{
.br
			System.out.println("INVALID INPUT");
.br
		}
.br
		else
.br
		{
.br
			System.out.println("The required Number = "+s.M);
.br
			System.out.println("Total number of digits = "+digits);
.br
		}
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
 lower bound of operations
T}|int|SumDigit
N|T{
 the number to be derived from digits
T}|int|SumDigit
M|T{
 local version of M for computation
T}|int|digitSum
sum|T{
 stores the sum of digits
T}|int|digitSum
digits|T{
 return the added digits
T}|int|genNum
sc|T{
 input handler
T}|Scanner|main
s|T{
 call genNum and display the value
T}|SumDigit|main
digits|T{
stores the digits
T}|int|main
.TE

.bp

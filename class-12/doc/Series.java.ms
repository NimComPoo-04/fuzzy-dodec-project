

.nr PS 12500
.SH
.DS C
.LG
.LG
.LG
.B

Assignment 13

.NL
.DE
.LP
.br
A superclass Number is defined to accept number of terms and also calculate the factorial of a
number. Define a subclass Series to find the product of the series
.br
P = x * x2/3! * x4/4! * x8/5! * x16/6! ......... n terms
.br
The details of the members of both classes are given below:
.br

Class name: Number
.br

Data member/instance variable:
.br
n: to store an integer number
.br

Member functions/methods:
.br
Number(int): constructor to initialize the data member
.br
int factorial(int a): returns the factorial of a number(use recursion)
.br
(factorial of n(n!) = 1 × 2 × 3 × …… × n)
.br
void display(): displays the value of n
.br

Class name: Series
.br

Data member/instance variable:
.br
prod: to store the product of the series
.br
x: accepts value of unknown variable x(in double)
.br

Member functions/methods:
.br
Series(…) : parameterized constructor to initialize the data members of both the classes
.br
void calProd(): calculates the PRODUCT of the given series
.br
void display(): displays the data members of both the classes
.br
*


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
.B Number
.br
Step 1:  Start
.br
Step 2:  initialize the value of n using local value
.br
Step 3:  End
.br

.br
.B factorial
.br
Step 1:  Start
.br
Step 2:  if a == 1 return a
.br
Step 3:  if that is not the case multiply a with the return value of factorial(a-1)
.br
Step 4:  End
.br

.br
.B display
.br
Step 1:  Start
.br
Step 2:  print the value of n
.br
Step 3:  End
.br

.br
.B Series
.br
Step 1:  Start
.br
Step 2:  initialize the super class object
.br
Step 3:  initialize the local value of x
.br
Step 4:  initialize prod to 1 (-_-)
.br
Step 5:  End
.br

.br
.B calProd
.br
Step 1:  Start
.br
Step 2:  loop using the iterator
.br
Step 3:  generate the product using the fomulae provided
.br
Step 4:  End
.br

.br
.B display
.br
Step 1:  Start
.br
Step 2:  call super's display function
.br
Step 3:  print the product of the value
.br
Step 4:  End
.br

.br
.B main
.br
Step 1:  Start
.br
Step 2:  generates the series from user input
.br
Step 3:  calculate the product
.br
Step 4:  display the product
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
class Number
.br
{
.br
	// to store an integer number
.br
	int n;
.br

.br
	Number(int n)
.br
	{
.br
		// initialize the value of n using local value
.br
		this.n = n;
.br
	}
.br

.br
	int factorial(int a)
.br
	{
.br
		// if a == 1 return a
.br
		if(a == 1) return a;
.br

.br
		// if that is not the case multiply a with the return value of factorial(a-1)
.br
		return a * factorial(a-1);
.br
	}
.br

.br
	void display()
.br
	{
.br
		// print the value of n
.br
		System.out.println("Value of N: " + this.n);
.br
	}
.br
}
.br

.br
public class Series extends Number
.br
{
.br
	// to store the product of the series
.br
	int prod;
.br

.br
	// accepts value of unknown variable x(in double)
.br
	int x;
.br

.br
	Series(int n, int x)
.br
	{
.br
		// initialize the super class object
.br
		super(n);
.br

.br
		// initialize the local value of x
.br
		this.x = x;
.br

.br
		// initialize prod to 1 (-_-)
.br
		this.prod = 1;
.br
	}
.br

.br
	void calProd()
.br
	{
.br
		// create an iterator
.br
		int i = 1;
.br

.br
		// loop using the iterator
.br
		// generate the product using the fomulae provided
.br
		while(i <= n)
.br
		{
.br
			this.prod *= Math.pow(x, i)/factorial(i);
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
		// call super's display function
.br
		super.display();
.br
		
.br
		// print the product of the value
.br
		System.out.println("Value of Product: " + this.prod);
.br
	}
.br

.br
	
.br
}
.br

.br
import java.util.Scanner;
.br
public class Series_main
.br
{
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
		// generates the series from user input
.br
		// series object
.br
		System.out.println("Enter n then x: ");
.br
		Series s = new Series(sc.nextInt(), sc.nextInt());
.br

.br
		// calculate the product
.br
		s.calProd();
.br

.br
		// display the product
.br
		s.display();
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
Variable Listing
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
n|T{
 to store an integer number
T}|int|Number
prod|T{
 to store the product of the series
T}|int|Number
x|T{
 accepts value of unknown variable x(in double)
T}|int|Number
i|T{
 create an iterator
T}|int|calProd
sc|T{
 input handler
T}|Scanner|main
s|T{
 series object
T}|Series|main
.TE

.bp

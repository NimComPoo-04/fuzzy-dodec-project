

.nr PS 12500
.SH
.DS C
.LG
.LG
.LG
.B

Assignment 9

.NL
.DE
.LP
.br
Q9) Design a class FiboPrime which will display all the the Fibonacci numbers upto n terms which have
atleast one prime digit in the number. For example 2,3,5,13,21 are some of the examples of Fibonacci
numbers having atleast one prime digit in it.
.br

Class name: FiboPrime
.br

Data members:
.br
n: number of terms
.br

Method:
.br
FiboPrime(int): constructor
.br

int fibo(int n): returns nth Fibonacci number
.br

void displayFiboPrimes(): Display all the Fibonacci numbers upto n terms which have
atleast one digit as prime
.br

boolean isPrime(int p): returns true or false if p is either prime or not.
.br

You can add method(s) if required.



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
.B FiboPrime
.br
Step 1:  Start
.br
Step 2:  initializing fibo prime using n
.br
Step 3:  End
.br

.br
.B fibo
.br
Step 1:  Start
.br
Step 2:  loop until n is zero
.br
Step 3:  set a = a+b
.br
Step 4:  and b = a-b
.br
Step 5:  return b as the nth fibo number
.br
Step 6:  End
.br

.br
.B isPrime
.br
Step 1:  Start
.br
Step 2:  if p is 1 then its not prime
.br
Step 3:  loop through numbers starting from 2 till p
.br
Step 4:  if anyone is divisible by p return flase
.br
Step 5:  if all the conditions fail then it must be true
.br
Step 6:  End
.br

.br
.B hasPrime
.br
Step 1:  Start
.br
Step 2:  loop throught the digits of a number
.br
Step 3:  if a prime number is found return true
.br
Step 4:  otherwise return false
.br
Step 5:  End
.br

.br
.B displayFiboPrimes
.br
Step 1:  Start
.br
Step 2:  loop through all the fibo numbers until n terms
.br
Step 3:  if a prime fibo is encountered print it
.br
Step 4:  End
.br

.br
.B main
.br
Step 1:  Start
.br
Step 2:  create an object using user input
.br
Step 3:  call displayFiboPrimes using that object
.br
Step 4:  End

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
public class FiboPrime
.br
{
.br
	// number of terms
.br
	int n;
.br

.br
	FiboPrime(int n)
.br
	{
.br
		// initializing fibo prime using n
.br
		this.n = n;
.br
	}
.br

.br
	int fibo(int n)
.br
	{
.br
		// second fibo number
.br
		int a = 1;
.br

.br
		// first fibo number
.br
		int b = 0;
.br

.br
		// loop until n is zero
.br
		// set a = a+b
.br
		// and b = a-b
.br
		while(n != 0)
.br
		{
.br
			a = a+b;
.br
			b = a-b;
.br
			n--;
.br
		}
.br

.br
		// return b as the nth fibo number
.br
		return b;
.br
	}
.br

.br
	boolean isPrime(int p)
.br
	{
.br
		// if p is 1 then its not prime
.br
		if(p == 1) return false;
.br

.br
		// iterator from 2 until p
.br
		int i = 2;
.br

.br
		// loop through numbers starting from 2 till p
.br
		// if anyone is divisible by p return flase
.br
		while(i != p)
.br
		{
.br
			if(p % i == 0)
.br
				return false;
.br
			i++;
.br
		}
.br

.br
		// if all the conditions fail then it must be true
.br
		return true;
.br
	}
.br

.br
	boolean hasPrime(int p)
.br
	{
.br
		// loop throught the digits of a number
.br
		// if a prime number is found return true
.br
		// otherwise return false
.br
		while(p != 0)
.br
		{
.br
			if(isPrime(p%10))
.br
				return true;
.br
			p/=10;
.br
		}
.br

.br
		return false;
.br
	}
.br

.br
	void displayFiboPrimes()
.br
	{
.br
		// iterator from 1 to n 
.br
		int i = 1;
.br

.br
		// fibo accumulator
.br
		int fb = 1;
.br

.br
		// loop through all the fibo numbers until n terms
.br
		// if a prime fibo is encountered print it
.br
		while(i < n)
.br
		{
.br
			fb = fibo(i);
.br
			if(hasPrime(fb))
.br
				System.out.println(fb);
.br
			i++;
.br
		}
.br
	}
.br

.br
	
.br
}
.br
import java.util.Scanner;
.br
public class FiboPrime_main
.br
{
.br
	public static void main(String args[])
.br
	{
.br
		// Input handler
.br
		Scanner sc = new Scanner(System.in);
.br

.br
		// create an object using user input
.br
		// call displayFiboPrimes using that object
.br
		new FiboPrime(sc.nextInt()).displayFiboPrimes();
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
n|T{
 number of terms
T}|int|FiboPrime
a|T{
 second fibo number
T}|int|fibo
b|T{
 first fibo number
T}|int|fibo
i|T{
 iterator from 2 until p
T}|int|isPrime
i|T{
 iterator from 1 to n 
T}|int|displayFiboPrimes
fb|T{
 fibo accumulator
T}|int|displayFiboPrimes
|T{

T}||
.TE

.bp

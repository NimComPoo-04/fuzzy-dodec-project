/**
Assignment 9.

Q9) Design a class FiboPrime which will display all the the Fibonacci numbers upto n terms which have
atleast one prime digit in the number. For example 2,3,5,13,21 are some of the examples of Fibonacci
numbers having atleast one prime digit in it.


Class name: FiboPrime


Data members:

n: number of terms


Method:

FiboPrime(int): constructor


int fibo(int n): returns nth Fibonacci number


void displayFiboPrimes(): Display all the Fibonacci numbers upto n terms which have
atleast one digit as prime


boolean isPrime(int p): returns true or false if p is either prime or not.


You can add method(s) if required.
 */

import java.util.Scanner;

public class FiboPrime
{
	// number of terms
	int n;

	FiboPrime(int n)
	{
		// initializing fibo prime using n
		this.n = n;
	}

	int fibo(int n)
	{
		// second fibo number
		int a = 1;

		// first fibo number
		int b = 0;

		// loop until n is zero
		// set a = a+b
		// and b = a-b
		while(n != 0)
		{
			a = a+b;
			b = a-b;
			n--;
		}

		// return b as the nth fibo number
		return b;
	}

	boolean isPrime(int p)
	{
		// if p is 1 then its not prime
		if(p == 1) return false;

		// iterator from 2 until p
		int i = 2;

		// loop through numbers starting from 2 till p
		// if anyone is divisible by p return flase
		while(i != p)
		{
			if(p % i == 0)
				return false;
			i++;
		}

		// if all the conditions fail then it must be true
		return true;
	}

	boolean hasPrime(int p)
	{
		// loop throught the digits of a number
		// if a prime number is found return true
		// otherwise return false
		while(p != 0)
		{
			if(isPrime(p%10))
				return true;
			p/=10;
		}

		return false;
	}

	void displayFiboPrimes()
	{
		// iterator from 1 to n 
		int i = 1;

		// fibo accumulator
		int fb = 1;

		// loop through all the fibo numbers until n terms
		// if a prime fibo is encountered print it
		while(i < n)
		{
			fb = fibo(i);
			if(hasPrime(fb))
				System.out.println(fb);
			i++;
		}
	}

	public static void main(String args[])
	{
		// Input handler
		Scanner sc = new Scanner(System.in);

		// create an object using user input
		// call displayFiboPrimes using that object
		new FiboPrime(sc.nextInt()).displayFiboPrimes();
	}
}

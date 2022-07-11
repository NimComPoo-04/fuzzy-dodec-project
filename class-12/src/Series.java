/**
Assignment 13.

A superclass Number is defined to accept number of terms and also calculate the factorial of a
number. Define a subclass Series to find the product of the series

P = x * x2/3! * x4/4! * x8/5! * x16/6! ......... n terms

The details of the members of both classes are given below:


Class name: Number


Data member/instance variable:

n: to store an integer number


Member functions/methods:

Number(int): constructor to initialize the data member

int factorial(int a): returns the factorial of a number(use recursion)

(factorial of n(n!) = 1 × 2 × 3 × …… × n)

void display(): displays the value of n


Class name: Series


Data member/instance variable:

prod: to store the product of the series

x: accepts value of unknown variable x(in double)


Member functions/methods:

Series(…) : parameterized constructor to initialize the data members of both the classes

void calProd(): calculates the PRODUCT of the given series

void display(): displays the data members of both the classes

*/

import java.util.Scanner;

class Number
{
	// to store an integer number
	int n;

	Number(int n)
	{
		// initialize the value of n using local value
		this.n = n;
	}

	int factorial(int a)
	{
		// if a == 1 return a
		if(a == 1) return a;

		// if that is not the case multiply a with the return value of factorial(a-1)
		return a * factorial(a-1);
	}

	void display()
	{
		// print the value of n
		System.out.println("Value of N: " + this.n);
	}
}

public class Series extends Number
{
	// to store the product of the series
	int prod;

	// accepts value of unknown variable x(in double)
	int x;

	Series(int n, int x)
	{
		// initialize the super class object
		super(n);

		// initialize the local value of x
		this.x = x;

		// initialize prod to 1 (-_-)
		this.prod = 1;
	}

	void calProd()
	{
		// create an iterator
		int i = 1;

		// loop using the iterator
		// generate the product using the fomulae provided
		while(i <= n)
		{
			this.prod *= Math.pow(x, i)/factorial(i);
			i++;
		}
	}

	void display()
	{
		// call super's display function
		super.display();
		
		// print the product of the value
		System.out.println("Value of Product: " + this.prod);
	}

	public static void main(String args[])
	{
		// input handler
		Scanner sc = new Scanner(System.in);

		// generates the series from user input
		// series object
		System.out.println("Enter n then x: ");
		Series s = new Series(sc.nextInt(), sc.nextInt());

		// calculate the product
		s.calProd();

		// display the product
		s.display();
	}
}

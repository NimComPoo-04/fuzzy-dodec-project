/**
Assignment 8.

A class Mix has been defined to mix two words, character by character, in the following
manner:

The first character of the first word is followed by the first character of the second word and
so on. If the words are of different length, the remaining characters of the longer word are
put at the end.


Example: If the First word is "JUMP" and the second word is "STROLL", then the required word will be "JSUTMRPOLL"


Some of the memebers of the class are given below:


.B "Class Name"
	:	
.B "Mix"


.B "Data member/instance variable:"

	wrd		:	to store a word

	len		:	to store a word

.B "Memeber functions/methods:"

.TS
expand tab(|);
l l s.

Mix()|T{
:  default constructor to initialize
   the data members with legal initial value
T}

void feedword()|T{
:  to accept the word in UPPER case
T}

void mix_word(Mix P, Mix Q)|T{
:  mixes the words of object P and Q as
   stated above stores the resultant
   word in the current object
T}

void display()|T{
:  display the word
T}
.TE


Specify the class Mix giving the details of the constructor(), void feedword(), void mix_word(Mix, Mix)
and void display(). Define the main() function to create objects and call the functions accordingly
to enable the task.

 */

import java.util.Scanner;

public class Mix
{
	// to store a word
	String wrd;

	// to sotre the length of the word
	int len;

	Mix()
	{
		// Initialize values to default values
		// initializing wrd with ""
		this.wrd = "";

		// initializing len with 0
		this.len = 0;
	}

	void feedword()
	{
		// accept a singular word
		// input handler
		Scanner sc = new Scanner(System.in);

		// store the word in wrd
		this.wrd = sc.next();

		// check if the word is upper case
		// if no kill the program
		if(!this.wrd.toUpperCase().equals(this.wrd))
			System.exit(1);

		// otherwise initialize len
		this.len = this.wrd.length();
	}

	void mix_word(Mix P, Mix Q)
	{
		// loop throught the letter of P and Q until a boundary of the smaller is hit
		while(this.len < P.len && this.len < Q.len)
		{
			this.wrd += ""+P.wrd.charAt(this.len)+Q.wrd.charAt(this.len);
			this.len++;
		}

		// take the remaing value of P if any and add them to the wrd
		if(this.len < P.len)
			this.wrd += P.wrd.substring(this.len);

		// take the remaing value of Q if any and add them to the wrd
		if(this.len < Q.len)
			this.wrd += Q.wrd.substring(this.len);

		// correct the value of len
		this.len = this.wrd.length();
	}

	void display()
	{
		// display the value of the word
		System.out.println(this.wrd);
	}

	public static void main(String args[])
	{
		// P in the mix_word
		Mix P = new Mix();

		// Q in the mix_word
		Mix Q = new Mix();

		// the mix object for computation
		Mix m = new Mix();

		// accept input for P and Q
		P.feedword();
		Q.feedword();

		// call mix_word function to execute operation
		m.mix_word(P, Q);

		// display computed value
		m.display();
	}
}

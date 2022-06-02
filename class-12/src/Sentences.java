/**
Assignment 7.

Write a program to accetp a pragraph containing
.B TWO
senteces only. The sentences may be terminated by either '.', '?', or '!' only. Any other
character may be ignored. The words are to be separated by single blank space and must be
in UPPER CASE.


Perform the following tasks:

a) Check for the validity of the accepted paragraph for the number of sentecs and for the
terminating charater.

b) Separate the two sentences from the paragraph and find common words in the two 
senteces with their frequency of occurence in the paragraph.

c) Display both the sentences separately along with common words and their frequency, in
the format given below:


Test your program for the following data and some random data:


Example 1

INPUT:

		IS IT RAINING? YOU MAY GET WET IF IT IS RAINING.


OUTPUT:

		IS IT RAINING?

		YOU MAY GET WET IF IT IS RAINING.

		COMMON WORDS		FREQUENCY

		IS			2

		IT			2

		RAINING			2


Example 2

INPUT:

		ARE YOU COMMING? I AM GETTINNG LATE.

OUTPUT:

		ARE YOU COMMING?

		I AM GETTINNG LATE.


		NO COMMON WORDS

*/

import java.util.Scanner;

public class Sentences
{
	// sotres the actual raw input
	String raw;

	// stores the 2 sentences
	String[] sentences;

	Sentences(String raw)
	{
		// initializing the raw
		this.raw = raw;

		// initializing sentences with the given criteria
		this.sentences = raw.split("\\?|\\.|!");
	}

	boolean checkValidity()
	{
		// check if there is exactly 2 sentences
		// if not return false
		if(this.sentences.length != 2)
			return false;

		// convert the raw input to upper case
		// check if the upper cased string is exact match to the raw string
		// if not return false
		if(!this.raw.toUpperCase().equals(this.raw))
			return false;

		// if all conditions pass return true
		return true;
	}

	int findWordFrequency(String word)
	{
		// stores the frequency of words
		int f = 0;

		// the raw paragraph with a space at the end
		String raw = this.sentences[0]+" "+this.sentences[1]+" ";

		// stores the words present in raw
		String[] words = raw.split(" ");

		// gets the number of occurence of the particular word
		// loop through the local raw until no more words are left
		// check if the word matches if so increment f
		for(String w : words)
		{
			if(word.equals(w))
			{
				f++;
			}
		}

		// return frequeny of words
		return f;
	}

	String getCommonWord()
	{
		// the raw paragraph with a space at the end
		String raw = this.sentences[0]+" "+this.sentences[1]+" ";

		// generate the words for the sentences
		String[] words1 = this.sentences[0].split(" ");

		// generate the words for the sentences
		String[] words2 = this.sentences[1].split(" ");

		// generated common words formated output
		String x = "";

		// loop through the words
		// if a match is encountered print the word
		for(String w1 : words1)
		{
			for(String w2 : words2)
			{
				if(w1.equals(w2))
				{
					x += w1 + "\t\t"+ findWordFrequency(w1)+"\n";
					break;
				}
			}
		}

		// return the generated output
		return x;
	}

	public static void main(String args[])
	{
		// input handler
		Scanner sc = new Scanner(System.in);

		// setnece object
		Sentences se = new Sentences(sc.nextLine());
		
		// composited output
		String x = se.getCommonWord();

		// accept input
		// print the required value
		if(x.equals(""))
		{
			System.out.println("NO COMMON WORDS");
		}
		else
		{
			System.out.println(se.sentences[0].trim()+se.raw.charAt(se.sentences[0].length()));
			System.out.println(se.sentences[1].trim()+se.raw.trim().charAt(se.raw.trim().length()-1));
			System.out.println("\nCOMMON WORDS\tFREQUENCY");
			System.out.println(x);
		}
	}
}

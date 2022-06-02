/**
Assignment 12.

A super class Sentence accepts a sentence in uppercase terminated by ‘.’ only.
A subclass Encrypt will
encrypt the words in the sentence with a valid logic given below.


Class name: Sentence


Data members:

sen: accepts a sentence in uppercase and terminated by ‘.’ only.
Words in the sentence can be separated by one or more spaces.


Methods:

Sentence(String): constructor

void show(): update the sentence where each word will be separated by single space
and terminated by ‘.’.
Display the updated sentence.


Class name: Encrypt


Data member:

nsen: stores encrypted sentence


Methods:

Encrypt(...): constructor

void encrypt(): encrypt the words in the updated sentence
as per logic given below:

i)
For the word(s) starting with vowel, write the vowel then append consecutive consonants and
vowels present in the word. Example say if the word is EXAMINATION then encrypted word will
be EXAMINATINO

ii)
For the word(s) starting with consonant, arrange the characters in the word in descending order
as per ASCII value. Example say if the word is CONSTANT then encrypted word will be
TTSONNCA.

Finally create the encrypted sentence with encrypted word terminated by ‘.’

void show(): display updated original and encrypted sentence.

*/

import java.util.Scanner;

class Sentence
{
	// actual sentence
	String sen;

	Sentence(String sen)
	{
		// initialize the sentence
		this.sen = sen;
	}

	void show()
	{
		// display sen
		System.out.println(this.sen);
	}
}

public class Encrypt extends Sentence
{
	// stores encrypted sentence
	String nsen;

	Encrypt(String sen)
	{
		// initializing super class by sending original sentence
		super(sen);

		// initialize null sting for nsen
		this.nsen = "";
	}

	void encrypt()
	{
		// split the sentence into ' '
		// remove the '.' at the end becuase its of no use
		// words of the sentence ladies and gentle men
		String[] words = super.sen.substring(0, super.sen.length()-1).split(" ");

		// words iterator controler
		int i = 0;

		// iterate over the words
		// if the word starts with vowel
		// then attach vowels and consonats one after another
		// otherwise sort the whole chars in desending order
		// bubble sort the chars
		// if word length is 1 then dont do anything just attach the word
		while(i < words.length)
		{
			if(words[i].length() == 1)
			{
				this.nsen += words[i] + " ";
			}
			else if("aeiouAEIOU".indexOf(words[i].charAt(0)) >= 0)
			{
				// list of vowels
				String vowels = "";

				// list of consonants
				String consonants = "";

				// iterator j
				int j = 0;
				while(j < words[i].length())
				{
					if("aeiouAEIOU".indexOf(words[i].charAt(j)) >= 0)
					{
						vowels += words[i].charAt(j);
					}
					else
					{
						consonants += words[i].charAt(j);
					}
					j++;
				}

				j = 0;
				while(j < vowels.length() && j < consonants.length())
				{
					this.nsen += vowels.charAt(j);
					this.nsen += consonants.charAt(j);
					j++;
				}

				if(j < vowels.length())
					this.nsen += vowels.substring(j);

				if(j < consonants.length())
					this.nsen += consonants.substring(j);

				this.nsen += " ";
			}
			else
			{
				char[] letters = words[i].toCharArray();

				// iterator k
				int k = 0;

				// iterator l
				int l = 0;

				for(k = 0; k < letters.length; k++)
				{
					for(l = 0; l < letters.length-1; l++)
					{
						if(letters[l] < letters[l+1])
						{
							// duplicate letters
							char x = letters[l];
							letters[l] = letters[l+1];
							letters[l+1] = x;
						}
					}
				}

				this.nsen += new String(letters);

				this.nsen += " ";
			}
			i++;
		}
		this.nsen += ".";
	}

	void show()
	{
		// call the super show function
		super.show();

		// display the encrypted sentence
		System.out.println(this.nsen);
	}

	public static void main(String args[])
	{
		// input handler
		Scanner sc = new Scanner(System.in);

		// line input
		String line = sc.nextLine();

		// test if the line ends with '.'
		// if not nuke the program
		if(line.charAt(line.length()-1) != '.')
			return;

		// encrypt object creation
		Encrypt e = new Encrypt(line);

		// encrypt text supplied
		e.encrypt();

		// show the encrpyted text
		e.show();
	}
}

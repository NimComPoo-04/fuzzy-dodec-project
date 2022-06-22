

.nr PS 12500
.SH
.DS C
.LG
.LG
.LG
.B

Assignment 12

.NL
.DE
.LP
.br
A super class Sentence accepts a sentence in uppercase terminated by ‘.’ only.
A subclass Encrypt will
encrypt the words in the sentence with a valid logic given below.
.br

Class name: Sentence
.br

Data members:
.br
sen: accepts a sentence in uppercase and terminated by ‘.’ only.
Words in the sentence can be separated by one or more spaces.
.br

Methods:
.br
Sentence(String): constructor
.br
void show(): update the sentence where each word will be separated by single space
and terminated by ‘.’.
Display the updated sentence.
.br

Class name: Encrypt
.br

Data member:
.br
nsen: stores encrypted sentence
.br

Methods:
.br
Encrypt(...): constructor
.br
void encrypt(): encrypt the words in the updated sentence
as per logic given below:
.br
i)
For the word(s) starting with vowel, write the vowel then append consecutive consonants and
vowels present in the word. Example say if the word is EXAMINATION then encrypted word will
be EXAMINATINO
.br
ii)
For the word(s) starting with consonant, arrange the characters in the word in descending order
as per ASCII value. Example say if the word is CONSTANT then encrypted word will be
TTSONNCA.
.br
Finally create the encrypted sentence with encrypted word terminated by ‘.’
.br
void show(): display updated original and encrypted sentence.
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
.B Sentence
.br
Step 1:  Start
.br
Step 2:  initialize the sentence
.br
Step 3:  End
.br

.br
.B show
.br
Step 1:  Start
.br
Step 2:  display sen
.br
Step 3:  End
.br

.br
.B Encrypt
.br
Step 1:  Start
.br
Step 2:  initializing super class by sending original sentence
.br
Step 3:  initialize null sting for nsen
.br
Step 4:  End
.br

.br
.B encrypt
.br
Step 1:  Start
.br
Step 2:  split the sentence into ' '
.br
Step 3:  remove the '.' at the end becuase its of no use
.br
Step 4:  iterate over the words
.br
Step 5:  if the word starts with vowel
.br
Step 6:  then attach vowels and consonats one after another
.br
Step 7:  otherwise sort the whole chars in desending order
.br
Step 8:  bubble sort the chars
.br
Step 9:  End
.br

.br
.B show
.br
Step 1:  Start
.br
Step 2:  call the super show function
.br
Step 3:  display the encrypted sentence
.br
Step 4:  End
.br

.br
.B main
.br
Step 1:  Start
.br
Step 2:  test if the line ends with '.'
.br
Step 3:  if not nuke the program
.br
Step 4:  encrypt text supplied
.br
Step 5:  show the encrpyted text
.br
Step 6:  End

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
class Sentence
.br
{
.br
	// actual sentence
.br
	String sen;
.br

.br
	Sentence(String sen)
.br
	{
.br
		// initialize the sentence
.br
		this.sen = sen;
.br
	}
.br

.br
	void show()
.br
	{
.br
		// display sen
.br
		System.out.println(this.sen);
.br
	}
.br
}
.br

.br
public class Encrypt extends Sentence
.br
{
.br
	// stores encrypted sentence
.br
	String nsen;
.br

.br
	Encrypt(String sen)
.br
	{
.br
		// initializing super class by sending original sentence
.br
		super(sen);
.br

.br
		// initialize null sting for nsen
.br
		this.nsen = "";
.br
	}
.br

.br
	void encrypt()
.br
	{
.br
		// split the sentence into ' '
.br
		// remove the '.' at the end becuase its of no use
.br
		// words of the sentence ladies and gentle men
.br
		String[] words = super.sen.substring(0, super.sen.length()-1).split(" ");
.br

.br
		// words iterator controler
.br
		int i = 0;
.br

.br
		// iterate over the words
.br
		// if the word starts with vowel
.br
		// then attach vowels and consonats one after another
.br
		// otherwise sort the whole chars in desending order
.br
		// bubble sort the chars
.br
		// if word length is 1 then dont do anything just attach the word
.br
		while(i < words.length)
.br
		{
.br
			if(words[i].length() == 1)
.br
			{
.br
				this.nsen += words[i] + " ";
.br
			}
.br
			else if("aeiouAEIOU".indexOf(words[i].charAt(0)) >= 0)
.br
			{
.br
				// list of vowels
.br
				String vowels = "";
.br

.br
				// list of consonants
.br
				String consonants = "";
.br

.br
				// iterator j
.br
				int j = 0;
.br
				while(j < words[i].length())
.br
				{
.br
					if("aeiouAEIOU".indexOf(words[i].charAt(j)) >= 0)
.br
					{
.br
						vowels += words[i].charAt(j);
.br
					}
.br
					else
.br
					{
.br
						consonants += words[i].charAt(j);
.br
					}
.br
					j++;
.br
				}
.br

.br
				j = 0;
.br
				while(j < vowels.length() && j < consonants.length())
.br
				{
.br
					this.nsen += vowels.charAt(j);
.br
					this.nsen += consonants.charAt(j);
.br
					j++;
.br
				}
.br

.br
				if(j < vowels.length())
.br
					this.nsen += vowels.substring(j);
.br

.br
				if(j < consonants.length())
.br
					this.nsen += consonants.substring(j);
.br

.br
				this.nsen += " ";
.br
			}
.br
			else
.br
			{
.br
				char[] letters = words[i].toCharArray();
.br

.br
				// iterator k
.br
				int k = 0;
.br

.br
				// iterator l
.br
				int l = 0;
.br

.br
				for(k = 0; k < letters.length; k++)
.br
				{
.br
					for(l = 0; l < letters.length-1; l++)
.br
					{
.br
						if(letters[l] < letters[l+1])
.br
						{
.br
							// duplicate letters
.br
							char x = letters[l];
.br
							letters[l] = letters[l+1];
.br
							letters[l+1] = x;
.br
						}
.br
					}
.br
				}
.br

.br
				this.nsen += new String(letters);
.br

.br
				this.nsen += " ";
.br
			}
.br
			i++;
.br
		}
.br
		this.nsen += ".";
.br
	}
.br

.br
	void show()
.br
	{
.br
		// call the super show function
.br
		super.show();
.br

.br
		// display the encrypted sentence
.br
		System.out.println(this.nsen);
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
		// line input
.br
		String line = sc.nextLine();
.br

.br
		// test if the line ends with '.'
.br
		// if not nuke the program
.br
		if(line.charAt(line.length()-1) != '.')
.br
			return;
.br

.br
		// encrypt object creation
.br
		Encrypt e = new Encrypt(line);
.br

.br
		// encrypt text supplied
.br
		e.encrypt();
.br

.br
		// show the encrpyted text
.br
		e.show();
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
sen|T{
 actual sentence
T}|String|Sentence
nsen|T{
 stores encrypted sentence
T}|String|Sentence
words|T{
 words of the sentence ladies and gentle men
T}|String[]|encrypt
i|T{
 words iterator controler
T}|int|encrypt
vowels|T{
 list of vowels
T}|String|if
consonants|T{
 list of consonants
T}|String|if
j|T{
 iterator j
T}|int|if
letters|T{
 if word length is 1 then dont do anything just attach the word
T}|char[]|else
k|T{
 iterator k
T}|int|else
l|T{
 iterator l
T}|int|else
x|T{
 duplicate letters
T}|char|if
sc|T{
 input handler
T}|Scanner|main
line|T{
 line input
T}|String|main
e|T{
 encrypt object creation
T}|Encrypt|main
.TE

.bp

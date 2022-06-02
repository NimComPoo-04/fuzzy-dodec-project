.SH
.DS C
.LG
.LG
.LG
.B

Assignment 7

.NL
.DE
.LP
.br
Write a program to accetp a pragraph containing
.B TWO
senteces only. The sentences may be terminated by either '.', '?', or '!' only. Any other
character may be ignored. The words are to be separated by single blank space and must be
in UPPER CASE.
.br

Perform the following tasks:
.br
a) Check for the validity of the accepted paragraph for the number of sentecs and for the
terminating charater.
.br
b) Separate the two sentences from the paragraph and find common words in the two 
senteces with their frequency of occurence in the paragraph.
.br
c) Display both the sentences separately along with common words and their frequency, in
the format given below:
.br

Test your program for the following data and some random data:
.br

Example 1
.br
INPUT:
.br
		IS IT RAINING? YOU MAY GET WET IF IT IS RAINING.
.br

OUTPUT:
.br
		IS IT RAINING?
.br
		YOU MAY GET WET IF IT IS RAINING.
.br
		COMMON WORDS		FREQUENCY
.br
		IS			2
.br
		IT			2
.br
		RAINING			2
.br

Example 2
.br
INPUT:
.br
		ARE YOU COMMING? I AM GETTINNG LATE.
.br
OUTPUT:
.br
		ARE YOU COMMING?
.br
		I AM GETTINNG LATE.
.br

		NO COMMON WORDS
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
.B Sentences
.br
Step 1:  Start
.br
Step 2:  initializing the raw
.br
Step 3:  initializing sentences with the given criteria
.br
Step 4:  End
.br

.br
.B checkValidity
.br
Step 1:  Start
.br
Step 2:  check if there is exactly 2 sentences
.br
Step 3:  if not return false
.br
Step 4:  convert the raw input to upper case
.br
Step 5:  check if the upper cased string is exact match to the raw string
.br
Step 6:  if not return false
.br
Step 7:  if all conditions pass return true
.br
Step 8:  End
.br

.br
.B findWordFrequency
.br
Step 1:  Start
.br
Step 2:  gets the number of occurence of the particular word
.br
Step 3:  loop through the local raw until no more words are left
.br
Step 4:  check if the word matches if so increment f
.br
Step 5:  return frequeny of words
.br
Step 6:  End
.br

.br
.B getCommonWord
.br
Step 1:  Start
.br
Step 2:  loop through the words
.br
Step 3:  if a match is encountered print the word
.br
Step 4:  return the generated output
.br
Step 5:  End
.br

.br
.B main
.br
Step 1:  Start
.br
Step 2:  accept input
.br
Step 3:  print the required value
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
public class Sentences
.br
{
.br
	// sotres the actual raw input
.br
	String raw;
.br

.br
	// stores the 2 sentences
.br
	String[] sentences;
.br

.br
	Sentences(String raw)
.br
	{
.br
		// initializing the raw
.br
		this.raw = raw;
.br

.br
		// initializing sentences with the given criteria
.br
		this.sentences = raw.split("\\?|\\.|!");
.br
	}
.br

.br
	boolean checkValidity()
.br
	{
.br
		// check if there is exactly 2 sentences
.br
		// if not return false
.br
		if(this.sentences.length != 2)
.br
			return false;
.br

.br
		// convert the raw input to upper case
.br
		// check if the upper cased string is exact match to the raw string
.br
		// if not return false
.br
		if(!this.raw.toUpperCase().equals(this.raw))
.br
			return false;
.br

.br
		// if all conditions pass return true
.br
		return true;
.br
	}
.br

.br
	int findWordFrequency(String word)
.br
	{
.br
		// stores the frequency of words
.br
		int f = 0;
.br

.br
		// the raw paragraph with a space at the end
.br
		String raw = this.sentences[0]+" "+this.sentences[1]+" ";
.br

.br
		// stores the words present in raw
.br
		String[] words = raw.split(" ");
.br

.br
		// gets the number of occurence of the particular word
.br
		// loop through the local raw until no more words are left
.br
		// check if the word matches if so increment f
.br
		for(String w : words)
.br
		{
.br
			if(word.equals(w))
.br
			{
.br
				f++;
.br
			}
.br
		}
.br

.br
		// return frequeny of words
.br
		return f;
.br
	}
.br

.br
	String getCommonWord()
.br
	{
.br
		// the raw paragraph with a space at the end
.br
		String raw = this.sentences[0]+" "+this.sentences[1]+" ";
.br

.br
		// generate the words for the sentences
.br
		String[] words1 = this.sentences[0].split(" ");
.br

.br
		// generate the words for the sentences
.br
		String[] words2 = this.sentences[1].split(" ");
.br

.br
		// generated common words formated output
.br
		String x = "";
.br

.br
		// loop through the words
.br
		// if a match is encountered print the word
.br
		for(String w1 : words1)
.br
		{
.br
			for(String w2 : words2)
.br
			{
.br
				if(w1.equals(w2))
.br
				{
.br
					x += w1 + "\t\t"+ findWordFrequency(w1)+"\n";
.br
					break;
.br
				}
.br
			}
.br
		}
.br

.br
		// return the generated output
.br
		return x;
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
		// setnece object
.br
		Sentences se = new Sentences(sc.nextLine());
.br
		
.br
		// composited output
.br
		String x = se.getCommonWord();
.br

.br
		// accept input
.br
		// print the required value
.br
		if(x.equals(""))
.br
		{
.br
			System.out.println("NO COMMON WORDS");
.br
		}
.br
		else
.br
		{
.br
			System.out.println(se.sentences[0].trim()+se.raw.charAt(se.sentences[0].length()));
.br
			System.out.println(se.sentences[1].trim()+se.raw.trim().charAt(se.raw.trim().length()-1));
.br
			System.out.println("\nCOMMON WORDS\tFREQUENCY");
.br
			System.out.println(x);
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
raw|T{
 sotres the actual raw input
T}|String|Sentences
sentences|T{
 stores the 2 sentences
T}|String[]|Sentences
f|T{
 stores the frequency of words
T}|int|findWordFrequency
raw|T{
 the raw paragraph with a space at the end
T}|String|findWordFrequency
words|T{
 stores the words present in raw
T}|String[]|findWordFrequency
raw|T{
 the raw paragraph with a space at the end
T}|String|getCommonWord
words1|T{
 generate the words for the sentences
T}|String[]|getCommonWord
words2|T{
 generate the words for the sentences
T}|String[]|getCommonWord
x|T{
 generated common words formated output
T}|String|getCommonWord
sc|T{
 input handler
T}|Scanner|main
se|T{
 setnece object
T}|Sentences|main
x|T{
 composited output
T}|String|main
.TE

.bp

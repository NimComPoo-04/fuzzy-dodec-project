

.nr PS 12500
.SH
.DS C
.LG
.LG
.LG
.B

Assignment 8

.NL
.DE
.LP
.br
A class Mix has been defined to mix two words, character by character, in the following
manner:
.br
The first character of the first word is followed by the first character of the second word and
so on. If the words are of different length, the remaining characters of the longer word are
put at the end.
.br

Example: If the First word is "JUMP" and the second word is "STROLL", then the required word will be "JSUTMRPOLL"
.br

Some of the memebers of the class are given below:
.br

.B "Class Name"
	:	
.B "Mix"
.br

.B "Data member/instance variable:"
.br
	wrd		:	to store a word
.br
	len		:	to store a word
.br
.B "Memeber functions/methods:"
.br
.TS
expand tab(|);
l l s.
.br
Mix()|T{
:  default constructor to initialize
   the data members with legal initial value
T}
.br
void feedword()|T{
:  to accept the word in UPPER case
T}
.br
void mix_word(Mix P, Mix Q)|T{
:  mixes the words of object P and Q as
   stated above stores the resultant
   word in the current object
T}
.br
void display()|T{
:  display the word
T}
.TE
.br

Specify the class Mix giving the details of the constructor(), void feedword(), void mix_word(Mix, Mix)
and void display(). Define the main() function to create objects and call the functions accordingly
to enable the task.
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
.B Mix
.br
Step 1:  Start
.br
Step 2:  Initialize values to default values
.br
Step 3:  initializing wrd with ""
.br
Step 4:  initializing len with 0
.br
Step 5:  End
.br

.br
.B feedword
.br
Step 1:  Start
.br
Step 2:  accept a singular word
.br
Step 3:  store the word in wrd
.br
Step 4:  check if the word is upper case
.br
Step 5:  if no kill the program
.br
Step 6:  otherwise initialize len
.br
Step 7:  End
.br

.br
.B mix_word
.br
Step 1:  Start
.br
Step 2:  loop throught the letter of P and Q until a boundary of the smaller is hit
.br
Step 3:  take the remaing value of P if any and add them to the wrd
.br
Step 4:  take the remaing value of Q if any and add them to the wrd
.br
Step 5:  correct the value of len
.br
Step 6:  End
.br

.br
.B display
.br
Step 1:  Start
.br
Step 2:  display the value of the word
.br
Step 3:  End
.br

.br
.B main
.br
Step 1:  Start
.br
Step 2:  accept input for P and Q
.br
Step 3:  call mix_word function to execute operation
.br
Step 4:  display computed value
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
public class Mix
.br
{
.br
	// to store a word
.br
	String wrd;
.br

.br
	// to sotre the length of the word
.br
	int len;
.br

.br
	Mix()
.br
	{
.br
		// Initialize values to default values
.br
		// initializing wrd with ""
.br
		this.wrd = "";
.br

.br
		// initializing len with 0
.br
		this.len = 0;
.br
	}
.br

.br
	void feedword()
.br
	{
.br
		// accept a singular word
.br
		// input handler
.br
		Scanner sc = new Scanner(System.in);
.br

.br
		// store the word in wrd
.br
		this.wrd = sc.next();
.br

.br
		// check if the word is upper case
.br
		// if no kill the program
.br
		if(!this.wrd.toUpperCase().equals(this.wrd))
.br
			System.exit(1);
.br

.br
		// otherwise initialize len
.br
		this.len = this.wrd.length();
.br
	}
.br

.br
	void mix_word(Mix P, Mix Q)
.br
	{
.br
		// loop throught the letter of P and Q until a boundary of the smaller is hit
.br
		while(this.len < P.len && this.len < Q.len)
.br
		{
.br
			this.wrd += ""+P.wrd.charAt(this.len)+Q.wrd.charAt(this.len);
.br
			this.len++;
.br
		}
.br

.br
		// take the remaing value of P if any and add them to the wrd
.br
		if(this.len < P.len)
.br
			this.wrd += P.wrd.substring(this.len);
.br

.br
		// take the remaing value of Q if any and add them to the wrd
.br
		if(this.len < Q.len)
.br
			this.wrd += Q.wrd.substring(this.len);
.br

.br
		// correct the value of len
.br
		this.len = this.wrd.length();
.br
	}
.br

.br
	void display()
.br
	{
.br
		// display the value of the word
.br
		System.out.println(this.wrd);
.br
	}
.br

.br
	
.br
}
.br
import java.util.Scanner;
.br
public class Mix_main
.br
{
.br
	public static void main(String args[])
.br
	{
.br
		// P in the mix_word
.br
		Mix P = new Mix();
.br

.br
		// Q in the mix_word
.br
		Mix Q = new Mix();
.br

.br
		// the mix object for computation
.br
		Mix m = new Mix();
.br

.br
		// accept input for P and Q
.br
		P.feedword();
.br
		Q.feedword();
.br

.br
		// call mix_word function to execute operation
.br
		m.mix_word(P, Q);
.br

.br
		// display computed value
.br
		m.display();
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
wrd|T{
 to store a word
T}|String|Mix
len|T{
 to sotre the length of the word
T}|int|Mix
sc|T{
 input handler
T}|Scanner|feedword
|T{

T}||
|T{

T}||
|T{

T}||
.TE

.bp

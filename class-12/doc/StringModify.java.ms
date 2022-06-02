.SH
.DS C
.LG
.LG
.LG
.B

Assignment 5

.NL
.DE
.LP
.br
Design a class StringModify in your default package that will contain two methods that will work on string
values. The method definitions of the class is given below:
.br

i) StringModify(String st): parameterized constructor
.br

ii) String insertStringAt(String w,int pos): to insert string w at valid position pos and returns final sentence
without changing any other data.
.br

iii) String deleteCharAt(char w,int pos): to delete character w from valid position pos and returns final
sentence without changing any other data.
.br

Write a possible menu in main method to implement the above logic for any random sentence by calling methods.
.br

DO POSSIBLE CHECKING WHERE REQUIRED.



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
.B StringModify
.br
Step 1:  Start
.br
Step 2:  initializes the original
.br
Step 3:  End
.br

.br
.B insertStringAt
.br
Step 1:  Start
.br
Step 2:  checks if pos is a valid position
.br
Step 3:  if not return null
.br
Step 4:  append w at pos in st
.br
Step 5:  use the + string concatination operator
.br
Step 6:  End
.br

.br
.B deleteCharAt
.br
Step 1:  Start
.br
Step 2:  checks if pos is a valid position
.br
Step 3:  if not return null
.br
Step 4:  checks if the char at pos is actually the required char
.br
Step 5:  if yes then it returns modifined string otherwise just the original string
.br
Step 6:  End
.br

.br
.B main
.br
Step 1:  Start
.br
Step 2:  accept menu entry option
.br
Step 3:  if the option is rediculous just return
.br
Step 4:  accept a sentence
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
public class StringModify
.br
{
.br
	// original string
.br
	String st;
.br

.br
	StringModify(String st)
.br
	{
.br
		// initializes the original
.br
		this.st = st;
.br
	}
.br

.br
	String insertStringAt(String w, int pos)
.br
	{
.br
		// checks if pos is a valid position
.br
		// if not return null
.br

.br
		if(pos < 0 || pos >= this.st.length())
.br
			return null;
.br

.br
		// append w at pos in st
.br
		// use the + string concatination operator
.br
		
.br
		return this.st.substring(0, pos) + w + this.st.substring(pos);
.br
	}
.br

.br
	String deleteCharAt(char w, int pos)
.br
	{
.br
		// checks if pos is a valid position
.br
		// if not return null
.br

.br
		if(pos < 0 || pos >= this.st.length())
.br
			return null;
.br

.br
		// checks if the char at pos is actually the required char
.br
		// if yes then it returns modifined string otherwise just the original string
.br
		
.br
		return st.charAt(pos) == w ? this.st.substring(0, pos)+this.st.substring(pos+1) : this.st;
.br
	}
.br

.br
	public static void main(String args[])
.br
	{
.br
		// Input Handler
.br
		Scanner sc = new Scanner(System.in);
.br

.br
		// accept menu entry option
.br
		// option of menuentry
.br
		int opt = sc.nextInt();
.br

.br
		// if the option is rediculous just return
.br
		if(opt != 1 && opt != 2)
.br
			return;
.br

.br
		// accept a sentence
.br
		// generate an object of StringModify using that sentence
.br
		StringModify s = new StringModify(new Scanner(System.in).nextLine());
.br

.br
		// the new string that needs to be attached or removed
.br
		String w = sc.next();
.br

.br
		// position of the attachment or removal
.br
		int pos = sc.nextInt();
.br

.br
		switch(opt)
.br
		{
.br
			case 1:
.br
				System.out.println(s.insertStringAt(w, pos));
.br
				break;
.br

.br
			case 2:
.br
				System.out.println(s.deleteCharAt(w.charAt(0), pos));
.br
				break;
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
st|T{
 original string
T}|String|StringModify
sc|T{
 Input Handler
T}|Scanner|main
opt|T{
 option of menuentry
T}|int|main
s|T{
 generate an object of StringModify using that sentence
T}|StringModify|main
w|T{
 the new string that needs to be attached or removed
T}|String|main
pos|T{
 position of the attachment or removal
T}|int|main
.TE

.bp

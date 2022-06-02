/**
Assignment 5.

Design a class StringModify in your default package that will contain two methods that will work on string
values. The method definitions of the class is given below:


i) StringModify(String st): parameterized constructor


ii) String insertStringAt(String w,int pos): to insert string w at valid position pos and returns final sentence
without changing any other data.


iii) String deleteCharAt(char w,int pos): to delete character w from valid position pos and returns final
sentence without changing any other data.


Write a possible menu in main method to implement the above logic for any random sentence by calling methods.


DO POSSIBLE CHECKING WHERE REQUIRED.
 */

import java.util.Scanner;

public class StringModify
{
	// original string
	String st;

	StringModify(String st)
	{
		// initializes the original
		this.st = st;
	}

	String insertStringAt(String w, int pos)
	{
		// checks if pos is a valid position
		// if not return null

		if(pos < 0 || pos >= this.st.length())
			return null;

		// append w at pos in st
		// use the + string concatination operator
		
		return this.st.substring(0, pos) + w + this.st.substring(pos);
	}

	String deleteCharAt(char w, int pos)
	{
		// checks if pos is a valid position
		// if not return null

		if(pos < 0 || pos >= this.st.length())
			return null;

		// checks if the char at pos is actually the required char
		// if yes then it returns modifined string otherwise just the original string
		
		return st.charAt(pos) == w ? this.st.substring(0, pos)+this.st.substring(pos+1) : this.st;
	}

	public static void main(String args[])
	{
		// Input Handler
		Scanner sc = new Scanner(System.in);

		// accept menu entry option
		// option of menuentry
		int opt = sc.nextInt();

		// if the option is rediculous just return
		if(opt != 1 && opt != 2)
			return;

		// accept a sentence
		// generate an object of StringModify using that sentence
		StringModify s = new StringModify(new Scanner(System.in).nextLine());

		// the new string that needs to be attached or removed
		String w = sc.next();

		// position of the attachment or removal
		int pos = sc.nextInt();

		switch(opt)
		{
			case 1:
				System.out.println(s.insertStringAt(w, pos));
				break;

			case 2:
				System.out.println(s.deleteCharAt(w.charAt(0), pos));
				break;
		}
	}
}

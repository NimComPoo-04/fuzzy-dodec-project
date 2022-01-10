import java.util.Scanner ;

public class Change
{
	private String str;    // stores the word
	private String newstr; // stores the changed word
	private int len;       // length of the word

	Change()
	{
		this.str = "";
		this.newstr = "";
		this.len = 0;
	}

	// input a single word
	void inputword()
	{
		Scanner sc = new Scanner(System.in);
		this.str = sc.next();
		this.len = this.str.length();
	}

	// change the case of the letter
	char caseconvert(char ch)
	{
		if(ch >= 'a' && ch <= 'z') return (char)(ch - 'a' + 'A');
		if(ch >= 'A' && ch <= 'Z') return (char)(ch - 'A' + 'a');
		return ch;
	}

	void recchange(int a)
	{
		if(a >= this.len) return;
		this.newstr += caseconvert(this.str.charAt(a));
		recchange(a+1);
	}

	// display the strings
	void display()
	{
		System.out.println(this.str+"\n"+this.newstr);
	}
}

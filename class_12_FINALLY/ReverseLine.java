import java.util.Scanner;

public class ReverseLine
{
	String lines[];

	// Accepts input
	void accept()
	{
		Scanner sc = new Scanner(System.in);

		this.lines = new String[sc.nextInt()];
		for(int i = 0; i < this.lines.length; i++)
			lines[i] = new Scanner(System.in).nextLine();
	}

	// displays the text in the required way
	void display()
	{
		for(int i = 0; i < this.lines.length; i++)
		{
			String[] k = this.lines[i].split("(\\ |\\`|\\.|\\,|\\;|\\:)+");
			for(int j = k.length-1; j >= 0; j--)
			{
				System.out.print(k[j]+" ");
			}
		}
		System.out.println();
	}

	public static void main(String args[])
	{
		ReverseLine r = new ReverseLine();
		r.accept();
		r.display();
	}
}

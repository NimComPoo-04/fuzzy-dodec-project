import java.util.Scanner;
public class StringModify_main
{
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

import java.util.Scanner;
public class Encrypt_main
{
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

import java.util.Scanner;
public class ToHex_main
{
	public static void main(String arg[])
	{
		// input handler
		Scanner sc = new Scanner(System.in);

		// object is generated using user input
		// to hex object
		ToHex th = new ToHex(sc.nextInt());

		// execute bin_hex
		th.bin_hex();

		// display the usable information
		th.display();
	}
}

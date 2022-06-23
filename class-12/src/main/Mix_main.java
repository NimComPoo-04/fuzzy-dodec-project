import java.util.Scanner;
public class Mix_main
{
	public static void main(String args[])
	{
		// P in the mix_word
		Mix P = new Mix();

		// Q in the mix_word
		Mix Q = new Mix();

		// the mix object for computation
		Mix m = new Mix();

		// accept input for P and Q
		P.feedword();
		Q.feedword();

		// call mix_word function to execute operation
		m.mix_word(P, Q);

		// display computed value
		m.display();
	}
}

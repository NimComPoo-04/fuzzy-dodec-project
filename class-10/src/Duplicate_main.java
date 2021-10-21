import java.util.Scanner ;
public class Duplicate_main
{
	// entry point of Duplicate_main
	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in) ; // input handler
		int num = sc.nextInt() ; // number of elements of array because java is retarded
		int nx[] = new int[num] ; // the array because java does not do it for me
		while(num-- != 0) nx[num] = sc.nextInt() ; // intputs the numbers required 

		// did all the array resizing and printing so nothing left to do
		new Duplicate().removeDupAndPrint(nx) ;
	}
}

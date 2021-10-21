import java.util.Scanner ;
public class Mixer_main
{
	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in) ;
		int n1 = 0; // two different elements
		int n2 = 0;

		System.out.print("Number Of Elements: ") ;

		do{ n1 = sc.nextInt() ;}while(n1 <= 0) ; // inputs of both
		do{ n2 = sc.nextInt() ;}while(n2 <= 0) ;

		Mixer m1 = new Mixer(n1) ; // initializing 2 objs
		Mixer m2 = new Mixer(n2) ;
		
		m1.accept() ; // accepts input in mixer
		m2.accept() ;

		Mixer m3 = m1.mix(m2) ; // mixes the stuff

		System.out.println("Output: ") ; // prints the stuff out
		m3.display() ;
	}
}

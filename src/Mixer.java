import java.util.Scanner ;
public class Mixer
{
	int arr[] ; // to store elements of an array
	int n ; // to store the size of the array

	Mixer(int nn)
	{
		this.n = nn ;
		this.arr = new int[nn] ;
	}

	// accepts all the input in the arr array
	void accept()
	{
		Scanner sc = new Scanner(System.in) ;
		for(int i = 0; i < this.n; i++)
		{
			this.arr[i] = sc.nextInt() ; // int is the input type
		}
	}

	// mixes stuff like merge sort.
	Mixer mix(Mixer A)
	{
		Mixer m = new Mixer(this.n + A.n) ;

		// copy every thing to the m.arr first
		for(int i = 0; i < this.n; i++) m.arr[i] = this.arr[i] ;
		for(int i = this.n; i < m.n; i++) m.arr[i] = A.arr[i-this.n] ;

		// now sort the whole thing.
		for(int i = 1; i < m.n; ++i)
		{
			int key = m.arr[i] ;
			int j = i - 1 ;
			while(j >= 0 && m.arr[j] > key)
			{
				m.arr[j+1] = m.arr[j] ;
				--j ;
			}
			m.arr[j+1] = key ;
		}	
		return m ;
	}

	// print the whole beautiful *sigh* array
	// I had to write the same thing 10 times in a row
	// now I am tired. god save my soul.
	void display()
	{
		for(int i = 0; i < this.n; i++)
			System.out.print(this.arr[i]+" ") ;
		System.out.println() ;
	}
}

public class Alternate
{
	// fills the whole array
	void fill(int arr[], int nx[])
	{
		int pos = arr.length % 2 == 0 ? arr.length/2 - 1: arr.length/2 ;
		int dn = 1 ;

		// sorting the whole thing using insertion sort.
		for(int i = 0; i < arr.length; i++)
		{
			for(int j = 0; j < arr.length - 1; j++)
			{
				if(arr[j] > arr[j+1])
				{
					int tmp = arr[j] ;
					arr[j] = arr[j+1] ;
					arr[j+1] = tmp ;
				}
			}
		}

		// goes up 2 times because other wise things might result
		// in SIGSEGV which is what i dont't like.
		for(int i = 0; i < nx.length; i++)
		{
			pos -= i * (int)Math.pow(-1, i) ;
			nx[pos] = arr[i] ;
		}
	}
}

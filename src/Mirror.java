public class Mirror
{
	int A[][] ; // the matrix storage.
	int M ; // the size of the matrix.

	// Did i really have to give a comment here
	// is the function name not at all descriptive
	// :( Sorry but it hurts me.
	
	Mirror(int M, int A[][])
	{
		this.A = new int[M][M] ;

		// this deep copies the array and 
		// does not store the array reference
		// and thus it does not change the 
		// value of the input array.
		for(int i = 0; i < M*M; i++)
			this.A[i/M][i%M] = A[i/M][i%M] ;

		this.M = M ;
	}

	// prints the original matrix 
	void display_original()
	{
		for(int i = 0; i < M; i++)
		{
			for(int j = 0; j < M; j++)
			{
				System.out.print(A[i][j]+" ") ;
			}
			System.out.println() ;
		}
	}

	// mirrors the matrix prints the elements
	void display_mirror()
	{
		for(int i = 0; i < M; i++)
		{
			for(int j = 0; j < M; j++)
			{
				// reverses the order of the output counting
				// thus mirroring the matrix effectively
				System.out.print(A[i][M-1-j]+" ") ;
			}
			System.out.println() ;
		}
	}
}

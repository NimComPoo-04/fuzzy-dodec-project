public class MatSort
{
	private int A[][] ;
	private int N ;

	MatSort(int N)
	{
		this.N = N ;
		this.A = new int[N][N] ;
	}

	void boundarySort()
	{
		int x[] = new int[4 * (N-1)] ;
		int ix = 0 ;

		for(int i = 0; i < N-1; i++) x[ix++] = A[0][i];
		for(int i = 0; i < N-1; i++) x[ix++] = A[i][N-1];
		for(int i = N-1; i >= 1; i--) x[ix++] = A[N-1][i];
		for(int i = N-1; i >= 1; i--) x[ix++] = A[i][0];

		for(int i = 0; i < x.length; i++)
		{
			for(int j = 0; j < x.length - 1; j++)
			{
				if(x[j] < x[j+1])
				{
					int t = x[j] ;
					x[j] = x[j+1] ;
					x[j+1] = t ;
				}
			}
		}

		ix = 0 ;

		for(int i = 0; i < N-1; i++)  A[0][i]  = x[ix++];
		for(int i = 0; i < N-1; i++)  A[i][N-1]= x[ix++];
		for(int i = N-1; i >= 1; i--) A[N-1][i]= x[ix++];
		for(int i = N-1; i >= 1; i--) A[i][0]  = x[ix++];
	}

	void digdisp()
	{
		for(int i = 0; i < N; i++)
		{
			for(int j = 0; j < N; j++)
			{
				if(i == j || i == N-j-1)
					System.out.print(A[i][j]+" ") ;
				else
					System.out.print("  ") ;
			}
			System.out.print('\n') ;
		}
	}

	void display()
	{
		for(int i = 0; i < N; i++)
		{
			for(int j = 0; j < N; j++)
			{
				System.out.print(A[i][j]+" ") ;
			}
			System.out.print('\n') ;
		}
	}

	public void setA(int i, int j, int x)
	{
		A[i][j] = x ;
	}

	public int getN()
	{
		return N ;
	}
}

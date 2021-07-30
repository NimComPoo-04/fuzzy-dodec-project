import java.util.Scanner ;
public class EqMat 
{
	int a[][] ; // integer matrix storer
	int m ; // number of rows
	int n ; // number of cols

	// init function of java called the costructor
	EqMat(int mm, int nn)
	{
		this.m = mm ;
		this.n = nn ;
		this.a = new int[mm][nn] ;
	}

	// check if the whole thing works. it returns 1 if ok else 0
	int check(EqMat p, EqMat q)
	{
		if(p.m != q.m || p.n != q.n) return 0 ;
		for(int i = 0; i < p.m; i++)
		{
			for(int j = 0; j < q.n; j++)
			{
				// if one is not equal and thus it does not waste time
				if(p.a[i][j] != q.a[i][j])
					return 0 ;
			}
		}
		return 1 ;
	}

	// print the whole thing
	void print()
	{
		// loops through all the elements and prints the whole thing.
		for(int i = 0; i < this.m; i++)
		{
			for(int j = 0; j < this.n; j++)
			{
				System.out.print(this.a[i][j]+" ") ;
			}
			System.out.println() ;
		}
	}

	// reads matrix input from the start.
	void readarray()
	{
		Scanner sc = new Scanner(System.in) ;
		for(int i = 0; i < m; i++)
		{
			for(int j = 0; j < n; j++)
			{
				a[i][j] = sc.nextInt() ;
			}
		}
	}
}

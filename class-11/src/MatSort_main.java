import java.util.Scanner ;

public class MatSort_main
{
	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in) ;

		System.out.print("M= ") ;
		MatSort x = new MatSort(sc.nextInt()) ;

		if(x.getN() > 20 || x.getN() < 3)
		{
			System.out.println("OUTRANGE") ;
			return ;
		}

		for(int i = 0; i < x.getN(); i++)
		{
			for(int j = 0; j < x.getN(); j++)
			{
				x.setA(i, j, sc.nextInt());
			}
		}

		System.out.println("ORIGINAL MATRIX: ") ;
		x.display() ;
		x.boundarySort() ;
		System.out.println("REARRANGED MATRIX: ") ;
		x.display() ;
		System.out.println("DIAGONALS: ") ;
		x.digdisp() ;
	}
}

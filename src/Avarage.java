import java.util.Scanner ;
public class Avarage
{
	/* display smallest */
	void displaySmall(Scanner sc, int N)
	{
		// a very big number which is way above 100 so it will accomodate
		int avgl = 0xffffff ; /* least avarage of the const */
		String namel = "" ; /* name of the person begin tortured by society */
		while(N!=0)
		{
			System.out.println("Enter name and marks of 5 subjects: ") ;
			String name = sc.next() ;
			int a[] = {sc.nextInt(), sc.nextInt(), sc.nextInt(), sc.nextInt(), sc.nextInt()} ;
			int avg = (a[0] + a[1] + a[2] + a[3] + a[4])/5 ;
			if(avg < 0) return ; // best kind of err handeling

			if(avg < avgl)
			{
				avgl = avg ;
				namel = name ;
			}
			
			N-- ;
		}

		System.out.println("Least avg marks: "+avgl+" ; Name: "+namel) ;
	}
}

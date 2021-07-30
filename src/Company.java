public class Company
{
	int N ; // the number of boxes 
	int cartons[] ; // the varid capacity boxes list
	int num_cartons[] ; // the magnitude of each boxes
	int num_carton ; // this is the total number of cartons that are required
	int remainder ; // the remaining boxes after filling

	// creates the boxes and stuff
	Company(int N)
	{
		this.cartons = new int[]{48, 24, 12, 6} ;
		this.num_cartons = new int[this.cartons.length] ;
		this.N = N ;
		this.num_carton = 0 ;
	}

	void calculate()
	{
		// saves a local copy to calculate data
		int N = this.N ;	
		
		// rolls through all the cartons and calculates their magnitude.
		for(int i = 0; i < this.cartons.length; i++)
		{
			// gets how many can be acomodated in number of cartons
			this.num_cartons[i] = N / this.cartons[i] ;
			this.num_carton++ ;
			// then cheks how many remained.
			N %= this.cartons[i] ;
		}

		// checks if there are any remainders.
		this.remainder = N ;
	}

	// this function prints the whole thing in a fancy manner. i like it :)
	void pretty_print()
	{
		// the print statements are tweaked many times to get the correct result.
		for(int i = 0; i < this.num_cartons.length; i++)
		{
			if(this.num_cartons[i] != 0)
				System.out.println("\t\t\t"+this.cartons[i]+" x "+this.num_cartons[i]+"\t= "+
					(this.cartons[i]*this.num_cartons[i])) ;
		}
		System.out.println("Remaining boxes \t"+((this.remainder != 0)?this.remainder+" x 1\t= ":"\t= ")+this.remainder) ;
		System.out.println("Total Number of boxes \t\t= "+this.N) ;
		System.out.println("Total Number of cartons \t= "+this.N) ;
	}
}

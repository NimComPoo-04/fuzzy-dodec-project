public class Duplicate
{
	void removeDupAndPrint(int x[])
	{
		String out = "" ; // output

		// finds out the elements that are duplicate
		for(int i = 0; i < x.length; i++)
		{
			// index of returs -1 if element does not exist
			if(out.indexOf(x[i]+"") < 0) 
				out = x[i]+" "+out ;
		}

		// prints with a ,
		System.out.println(out.replace(" ", ", ")) ;
	}
}

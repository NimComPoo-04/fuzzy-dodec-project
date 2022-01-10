public class DeciOct
{
	private int n;   // stores the decimal number
	private int oct; // stores the octal equivalent number

	// construct to initialize the data members
	DeciOct()
	{
		this.n = 0;
		this.oct = 0;
	}

	// assign nn to n
	void getnum(int nn)
	{
		this.n = nn ;
	}

	// change to octal
	void deci_oct()
	{
		if(this.n <= 0)
		{
			int x = this.oct ;
			this.oct = 0 ;
			while(x != 0)
			{
				this.oct = this.oct * 10 + x % 10 ;
				x /= 10 ;
			}
		}
		else
		{
			this.oct = this.oct * 10 + this.n % 8 ;
			this.n /= 8 ;
			deci_oct() ;
		}
	}

	// display the decimal and octal number 
	void show()
	{
		System.out.println(this.n);
		deci_oct();
		System.out.println(this.oct);
	}
}

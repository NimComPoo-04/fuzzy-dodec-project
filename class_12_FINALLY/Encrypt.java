import java.util.Scanner;

public class Encrypt
{
	String sen;	// original sentence
	String nsen;	// updated sentence

	public Encrypt()
	{
		this.sen = "";
		this.nsen = "";
	}

	// Accepts input
	void accept()
	{
		Scanner sc = new Scanner(System.in);
		this.sen = sc.nextLine();

		while("?.!".indexOf(this.sen.charAt(this.sen.length()-1)) < 0 ||
				!this.sen.toUpperCase().equals(this.sen))
		{
			System.out.println("INVALID SENTENCE");
			this.sen = sc.nextLine();
		}
	}

	// encrypts the data
	void encrypt()
	{
		String words[] = this.sen.split(" ");

		for(int i = 0; i < words.length; i++)
		{
			String vowels = "";
			String consonants = "";

			for(int j = 0; j < words[i].length(); j++)
			{
				char c = words[i].charAt(j);

				if("AEIOU".indexOf(c) >= 0)
					vowels += c;
				else
					consonants += c;
			}

			vowels = new String(sort(vowels.toCharArray()));

			this.nsen += vowels + consonants + " ";
		}

		this.nsen = this.nsen.trim();
	}

	// sorts characters
	char[] sort(char a[])
	{
		char ret[] = new char[a.length];
		char vowels[] = "AEIOU".toCharArray();

		int x = 0;

		// No standard sorting logic used because this is a speacial case and
		// allows for a better performing algorithm
		for(int i = 0; i < 5; i++)
		{
			for(int j = 0; j < a.length; j++)
			{
				if(vowels[i] == a[j])
					ret[x++] = a[j];
			}
		}

		return ret;
	}

	public static void main(String args[])
	{
		Encrypt e = new Encrypt();
		e.accept();
		System.out.println("Original: "+e.sen);

		e.encrypt();
		System.out.println("Encrypted: "+e.nsen);
	}
}

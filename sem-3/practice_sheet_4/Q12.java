package ps4;

import java.util.Scanner;

import java.io.File;
import java.io.FileOutputStream;

import java.io.IOException;

public class Q12
{
	public static int writeRecords(String ofname, Record recs[])
	{
		int count = 0;

		try
		{
			File f = new File(ofname);

			if(!f.exists())
				f.createNewFile();

			FileOutputStream fos = new FileOutputStream(f);
			byte bytes[] = Record.toString(recs).getBytes();
			fos.write(bytes);
			count = bytes.length;
			fos.close();
		}
		catch(IOException e)
		{
			System.err.println(e.getMessage());
		}

		return count;
	}

	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in);

		System.out.print("Enter output file name: ");
		String ofname = sc.next();

		System.out.print("Enter number of records: ");
		Record recs[] = Record.getRecords(sc, sc.nextInt());

		int bytes = writeRecords(ofname, recs);
		System.out.println("Number of bytes written = " + bytes);
	}

	static private class Record
	{
		private String name;
		private int roll;
		private int scores[];

		Record(String name, int roll, int... scores)
		{
			this.name = name;
			this.roll = roll;
			this.scores = scores;
		}

		int total()
		{
			int value = 0;
			for(int i = 0; i < scores.length; i++)
				value += scores[i];
			return value;
		}

		double average()
		{
			return total() / scores.length;
		}

		public String toString()
		{
			String out = name + ", " + roll+ ", ";

			for(int i = 0; i < scores.length; i++)
				out += scores[i] + ", ";

			out += total() + ", ";
			out += average();

			return out;
		}

		static Record[] getRecords(Scanner sc, int n)
		{
			Record r[] = new Record[n];

			System.out.println("Enter Name, roll, p1, p2, p3: ");
			for(int i = 0; i < r.length; i++)
				r[i] = new Record(sc.next(), sc.nextInt(), sc.nextInt(), sc.nextInt(), sc.nextInt());

			return r;
		}

		public static String toString(Record r[])
		{
			String out = "";
			for(Record k : r)
				out += k;
			return out;
		}
	}
}

package ps4;

import java.util.Scanner;

import java.io.File;
import java.io.FileOutputStream;

import java.io.IOException;

public class Q6
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
		private String email;
		private long mobile;

		Record(String name, String email, long mobile)
		{
			this.name = name;
			this.email = email;
			this.mobile = mobile;
		}

		public String toString()
		{
			return name + ", " + email + ", " + mobile + "\n";
		}

		static Record[] getRecords(Scanner sc, int n)
		{
			Record r[] = new Record[n];

			System.out.println("Enter Name, Email, Mobile Number: ");
			for(int i = 0; i < r.length; i++)
				r[i] = new Record(sc.next(), sc.next(), sc.nextLong());

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

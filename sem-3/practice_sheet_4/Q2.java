package ps4;

import java.util.Scanner;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

import java.io.IOException;

public class Q2
{
	public static int splitFile(String ifname, String ofname1, String ofname2)
	{
		int count = 0;

		try
		{
			File f = new File(ifname);
			FileInputStream fis = new FileInputStream(f);

			FileOutputStream fos1 = new FileOutputStream(ofname1);
			FileOutputStream fos2 = new FileOutputStream(ofname2);

			byte buffer[] = new byte[(int)f.length()];
			count = fis.read(buffer, 0, buffer.length);

			fos1.write(buffer, 0, buffer.length / 2);
			fos2.write(buffer, buffer.length / 2, buffer.length - buffer.length / 2);

			fis.close();
			fos1.close();
			fos2.close();

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

		System.out.print("Enter input file name: ");
		String ifname = sc.next();

		System.out.print("Enter output file names: ");
		String ofname1 = sc.next();
		String ofname2 = sc.next();

		int bytes = splitFile(ifname, ofname1, ofname2);
		System.out.println("Number of bytes copied = " + bytes);
	}
}

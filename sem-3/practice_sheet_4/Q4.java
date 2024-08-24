package ps4;

import java.util.Scanner;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

import java.io.IOException;

public class Q4
{
	public static int copyLowerCaseFile(String ifname, String ofname)
	{
		int count = 0;

		try
		{
			File f = new File(ifname);
			FileInputStream fis = new FileInputStream(f);
			FileOutputStream fos = new FileOutputStream(ofname);

			byte buffer[] = new byte[(int)f.length()];
			count = fis.read(buffer, 0, buffer.length);

			for(int i = 0; i < buffer.length; i++)
				fos.write((byte)Character.toUpperCase((char)buffer[i]));

			fis.close();
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

		System.out.print("Enter input file name: ");
		String ifname = sc.next();

		System.out.print("Enter output file name: ");
		String ofname = sc.next();

		int bytes = copyLowerCaseFile(ifname, ofname);
		System.out.println("Number of bytes copied = " + bytes);
	}
}

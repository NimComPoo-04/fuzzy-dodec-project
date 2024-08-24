package ps4;

import java.util.Scanner;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

import java.io.IOException;

public class Q5
{
	public static int copyFileToScreen(String ifname)
	{
		int count = 0;

		try
		{
			File f = new File(ifname);
			FileInputStream fis = new FileInputStream(f);

			byte buffer[] = new byte[(int)f.length()];
			count = fis.read(buffer, 0, buffer.length);

			System.out.write(buffer, 0, buffer.length);

			fis.close();
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

		int bytes = copyFileToScreen(ifname);
		System.out.println("Number of bytes copied = " + bytes);
	}
}

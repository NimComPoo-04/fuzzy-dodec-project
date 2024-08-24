package ps4;

import java.util.Scanner;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

import java.io.IOException;

public class Q7
{
	public static String writeValidWordFile(String ifname, String ofname)
	{
		String values = "";

		try
		{
			File f = new File(ifname);
			FileInputStream fis = new FileInputStream(f);
			FileOutputStream fos = new FileOutputStream(ofname);

			byte buffer[] = new byte[(int)f.length()];
			fis.read(buffer, 0, buffer.length);

			String content = new String(buffer);

			String words[] = content.split("[^a-zA-Z]+");
			values = String.join(" ", words);

			fos.write(values.getBytes());

			fis.close();
			fos.close();

		}
		catch(IOException e)
		{
			System.err.println(e.getMessage());
		}

		return values;
	}

	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in);

		System.out.print("Enter input file name: ");
		String ifname = sc.next();

		System.out.print("Enter output file name: ");
		String ofname = sc.next();

		String bytes = writeValidWordFile(ifname, ofname);
		System.out.println(bytes);
	}
}

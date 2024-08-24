package ps4;

import java.util.Arrays;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

import java.io.IOException;

public class Q11
{
	public static int splitFile(String ifname, String ofname[])
	{
		int count = 0;

		try
		{
			File f = new File(ifname);
			FileInputStream fis = new FileInputStream(f);

			FileOutputStream fos[] = new FileOutputStream[ofname.length];
			for(int i = 0; i < fos.length; i++)
				fos[i] = new FileOutputStream(ofname[i]);

			byte buffer[] = new byte[(int)f.length()];
			count = fis.read(buffer, 0, buffer.length);

			int width = buffer.length / ofname.length;
			if(width <= 0)
			{
				System.err.print("bruh what!!");
				System.exit(1);
			}

			for(int i = 0; i < fos.length; i++)
				fos[i].write(buffer, i * width, width);

			fis.close();

			for(int i = 0; i < fos.length; i++)
				fos[i].close();
		}
		catch(IOException e)
		{
			System.err.println(e.getMessage());
		}

		return count;
	}	

	public static void main(String args[])
	{
		if(args.length < 2)
			return;

		int bytes = splitFile(args[0], Arrays.copyOfRange(args, 1, args.length));
		System.out.println("Number of bytes copied = " + bytes);
	}
}

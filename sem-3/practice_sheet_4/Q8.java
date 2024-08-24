package ps4;

import java.util.Scanner;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

import java.io.IOException;

public class Q8
{
	/*
	 * state = 0   : reading normally
	 * state = 1   : expecting comment
	 * state = 2   : reading single line comment
	 * state = 3   : reading multiline comment
	 * state = 4   : expecting end of comment
	 *
	 * If state = 0 and we encounter a '/' then we jumpt to expecting comment else we push k
	 * If state = 1 and if we encounter a '/' then we jump to single line
	 *                  if we encounter a '*' then we jump to multiline 
	 *                  else we push '/', k
	 * If state = 2 and if we encounter a '\n' then we push '\n' and jump to normal
	 * If state = 3 and if we encounter a '*' then we jump to expecting end of comment 
	 * If state = 4 and if we encounter a '/' then we push ' ' and jump to normal
	 *                  else we jump to state 3
	 *
	 * If we are reading comments i.e in state 2 or 3 we increment counter of lines if encounter '\n'
	 */

	public static Object[] removeComments(String contents)
	{
		String out = "";

		int state = 0;
		int count = 0;

		for(char k : contents.toCharArray())
		{
			switch(state)
			{
				case 0:
					switch(k)
					{
						case '/':
							state = 1;
							break;

						default:
							out += k;
					}
					break;

				case 1:
					switch(k)
					{
						case '/':
							state = 2;
							break;

						case '*':
							state = 3;
							break;

						default:
							out += '/';
							out += k;
							state = 0;
					}
					break;

				case 2:
					switch(k)
					{
						case '\n':
							count++;
							out += '\n';
							state = 0;
							break;
					}
					break;

				case 3:
					switch(k)
					{
						case '*':
							state = 4;
							break;

						case '\n':
							count++;
					}
					break;

				case 4:
					switch(k)
					{
						case '/':
							out += ' ';
							state = 0;
							break;

						case '\n':
							count++;

						default:
							state = 3;
					}
					break;
			}
		}

		return new Object[]{count, out};
	}

	public static String readContents(String ifname)
	{
		try
		{
			File f = new File(ifname);

			FileInputStream fis = new FileInputStream(f);

			byte b[] = new byte[(int)f.length()];
			fis.read(b, 0, b.length);
			fis.close();

			return new String(b);
		}
		catch(IOException e)
		{
			System.err.println(e.getMessage());
		}

		return "";
	}

	public static void writeContents(String ofname, String data)
	{
		try
		{
			FileOutputStream fos = new FileOutputStream(ofname);
			fos.write(data.getBytes());
			fos.close();
		}
		catch(IOException e)
		{
			System.err.println(e.getMessage());
		}
	}

	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in);

		System.out.print("Enter input file name: ");
		String ifname = sc.next();

		System.out.print("Enter output file name: ");
		String ofname = sc.next();

		Object obj[] = removeComments(readContents(ifname));

		int count = (int)obj[0];
		String content = (String)obj[1];

		writeContents(ofname, content);

		System.out.println("Number of bytes copied = " + count);
	}
}

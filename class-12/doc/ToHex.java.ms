

.nr PS 12500
.SH
.DS C
.LG
.LG
.LG
.B

Assignment 11

.NL
.DE
.LP
.br
A superclass Binary has been defined to accept a binary number and a subclass ToHex has been defined to
convert binary number into its equivalent hexadecimal number using short cut logic of combining bits. Some of the
members of the class are given below:
.br

Class name : Binary
.br

Data members
.br
n : stores the binary number
.br

Member functions:
.br
BinHex(int n) : constructor to initialize the data member
.br
void display(): display the binary number
.br

Class name: ToHex
.br

Data member:
.br
hex: to store hexadecimal number
.br

Methods:
.br
ToHex(...): parameterized constructor
.br
void bin_hex() : calculates the hexadecimal equivalent of n and stores it in hex.( using short cut logic of combining bits)
.br
void display() : displays the binary number and hexadecimal number. You can add any extra methods if required.
.br
Using concept of inheritance write details of both the classes and write main method accordingly.
.br
*


.bp
.SH
.DS C
.LG
.LG
.B
Algorithm
.NL
.DE

.LP

.br

.br
.B BinHex
.br
Step 1:  Start
.br
Step 2:  initialize n using local n
.br
Step 3:  End
.br

.br
.B display
.br
Step 1:  Start
.br
Step 2:  loop through n digits
.br
Step 3:  when n is zero exit
.br
Step 4:  print each digit of number
.br
Step 5:  display a new line at the end for pretty print
.br
Step 6:  End
.br

.br
.B ToHex
.br
Step 1:  Start
.br
Step 2:  initialize super object
.br
Step 3:  hexnumber version of n
.br
Step 4:  End
.br

.br
.B bin_hex
.br
Step 1:  Start
.br
Step 2:  until n is zero loop
.br
Step 3:  generate a number from binary encoded decimal number
.br
Step 4:  attaching the number after generation to the hex value
.br
Step 5:  remove 4 digits from the end of n
.br
Step 6:  End
.br

.br
.B display
.br
Step 1:  Start
.br
Step 2:  calling super's display function
.br
Step 3:  a character mapper is used for prining
.br
Step 4:  loop through n digits base 16
.br
Step 5:  when n is zero exit
.br
Step 6:  print each digit of number
.br
Step 7:  display a subtle newline at the end
.br
Step 8:  End
.br

.br
.B main
.br
Step 1:  Start
.br
Step 2:  object is generated using user input
.br
Step 3:  execute bin_hex
.br
Step 4:  display the usable information
.br
Step 5:  End

.bp
.SH
.DS C
.LG
.LG
.B
Source Code
.NL
.DE
.LP
.SM
.fam C

.br

.br
import java.util.Scanner;
.br

.br
class BinHex
.br
{
.br
	// stores the binary number
.br
	int n;
.br

.br
	BinHex(int n)
.br
	{
.br
		// initialize n using local n
.br
		this.n = n;
.br
	}
.br

.br
	void display()
.br
	{
.br
		// local version of n
.br
		int n = this.n;
.br

.br
		// output number
.br
		String output = "";
.br

.br
		// loop through n digits
.br
		// when n is zero exit
.br
		// print each digit of number
.br
		while(n != 0)
.br
		{
.br
			output = n%10 + output;
.br
			n /= 10;
.br
		}
.br

.br
		// display a new line at the end for pretty print
.br
		System.out.println(output);
.br
	}
.br
}
.br

.br
public class ToHex extends BinHex
.br
{
.br
	// to store hexadecimal number
.br
	int hex;
.br

.br
	ToHex(int n)
.br
	{
.br
		// initialize super object
.br
		super(n);
.br

.br
		// hexnumber version of n
.br
		this.hex = 0;
.br
	}
.br

.br
	void bin_hex()
.br
	{
.br
		// local copy of n
.br
		int n = super.n;
.br

.br
		// shift register
.br
		int shl = 0;
.br

.br
		// until n is zero loop
.br
		// generate a number from binary encoded decimal number
.br
		// attaching the number after generation to the hex value
.br
		// remove 4 digits from the end of n
.br
		while(n != 0)
.br
		{
.br
			// decoded binary encoded decimal
.br
			int number = (((n % 10000)/1000) << 3) |
.br
				(((n % 1000)/100) << 2) |
.br
				(((n % 100)/10) << 1) |
.br
				(n % 10);
.br

.br
			this.hex = this.hex | (number << shl);
.br

.br
			n /= 10000;
.br
			shl += 4;
.br
		}
.br
	}
.br

.br
	void display()
.br
	{
.br
		// calling super's display function
.br
		super.display();
.br

.br
		// output number
.br
		String output = "";
.br

.br
		// a character mapper is used for prining
.br
		// a hex character mapper
.br
		char[] hex_map = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};
.br

.br
		// loop through n digits base 16
.br
		// when n is zero exit
.br
		// print each digit of number
.br
		while(hex != 0)
.br
		{
.br
			output = hex_map[hex%16] + output;
.br
			hex /= 16;
.br
		}
.br

.br
		// display a subtle newline at the end
.br
		System.out.println(output);
.br
	}
.br

.br
	public static void main(String arg[])
.br
	{
.br
		// input handler
.br
		Scanner sc = new Scanner(System.in);
.br

.br
		// object is generated using user input
.br
		// to hex object
.br
		ToHex th = new ToHex(sc.nextInt());
.br

.br
		// execute bin_hex
.br
		th.bin_hex();
.br

.br
		// display the usable information
.br
		th.display();
.br
	}
.br
}
.br

.fam
.NL

.bp
.SH
.DS C
.LG
.LG
.B
Varible Listing
.NL
.DE

.LP
.TS
expand center tab(|);
- - - - -
|cb |cb s| cb |cb|
- - - - -
|l |l s| l |l|.
Name|Function|Type|Scope
n|T{
 stores the binary number
T}|int|BinHex
n|T{
 local version of n
T}|int|display
output|T{
 output number
T}|String|display
hex|T{
 to store hexadecimal number
T}|int|BinHex
n|T{
 local copy of n
T}|int|bin_hex
shl|T{
 shift register
T}|int|bin_hex
number|T{
 decoded binary encoded decimal
T}|int|while
output|T{
 output number
T}|String|display
hex_map|T{
 a hex character mapper
T}|char[]|display
sc|T{
 input handler
T}|Scanner|main
th|T{
 to hex object
T}|ToHex|main
.TE

.bp

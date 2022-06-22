

.nr PS 12500
.SH
.DS C
.LG
.LG
.LG
.B

Assignment 3

.NL
.DE
.LP
.br
Write a program to take lower and upper range from the user and print all the binodd numbers within
that range. (A binodd number is a number whose binary equivalent have all the 1s present in the odd
position of the binary number considering from MSB to LSB) Example: 17 is a binodd number as its binary
equivalent is 10001 where 1s are in the position 1st and 5th position of the binary number which are odd
position of the number.


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
.B isBinOdd
.br
Step 1:  Start
.br
Step 2:  loop until num not equals to zero
.br
Step 3:  two bits are checked 
.br
Step 4:  if they are not 01 then its an anomly
.br
Step 5:  therefore return false
.br
Step 6:  otherwise return true
.br
Step 7:  End
.br

.br
.B main
.br
Step 1:  Start
.br
Step 2:  accpet upper limit
.br
Step 3:  accpet lower limit
.br
Step 4:  loop from lower limit to upper limit
.br
Step 5:  if any big odds are encountered print it
.br
Step 6:  End

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
import java.util.Scanner ;
.br

.br
public class BinOdd
.br
{
.br
	static boolean isBinOdd(int num)
.br
	{
.br
		// loop until num not equals to zero
.br
		// two bits are checked 
.br
		// if they are not 01 then its an anomly
.br
		// therefore return false
.br
		while(num != 0)
.br
		{
.br
			if((num & 3) != 1)
.br
				return false;
.br
			num >>= 2;
.br
		}
.br

.br
		// otherwise return true
.br
		return true;
.br
	}
.br

.br
	public static void main(String args[])
.br
	{
.br
		// input handler
.br
		Scanner sc = new Scanner(System.in);
.br

.br
		// accpet upper limit
.br
		// upper limit
.br
		int upper_limit = sc.nextInt();
.br

.br
		// accpet lower limit
.br
		// lower limit
.br
		int lower_limit = sc.nextInt();
.br

.br
		// loop from lower limit to upper limit
.br
		// if any big odds are encountered print it
.br
		while(lower_limit < upper_limit)
.br
		{
.br
			if(isBinOdd(lower_limit))
.br
				System.out.println(lower_limit);
.br
			lower_limit++;
.br
		}
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
sc|T{
 input handler
T}|Scanner|main
upper_limit|T{
 upper limit
T}|int|main
lower_limit|T{
 lower limit
T}|int|main
.TE

.bp

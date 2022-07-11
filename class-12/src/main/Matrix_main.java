import java.util.Scanner;
public class Matrix_main
{
	public static void main(String args[])
	{
		// accpting input from user
		// Matrix object
		System.out.println("Enter Matrix: ");
		Matrix m = Matrix.readMat();

		// displaying original matrix
		System.out.println("\nOriginal Matrix: ");
		m.display();

		// displaying the sum of the corners
		System.out.println("\nSum = "+m.unicodeSum());

		// roatate the actual matrix
		m.rotateMat();

		// display the rotated matrix
		System.out.println("\nFinal Matrix: ");
		m.display();
	}
}

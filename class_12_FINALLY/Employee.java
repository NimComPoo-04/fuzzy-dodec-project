import java.util.Scanner;

public class Employee
{
	String name;
	int code;
	int experience;
	double salary;

	Employee next;

	public Employee(String name, int code, int exp, double sal)
	{
		this.name = name;
		this.code = code;
		this.experience = exp;
		this.salary = sal;
	}

	// display only the small things
	void display()
	{
		if(this.name == null)
			return;
		System.out.print("( Name: "+this.name+" Code: "+this.code+" Experience: "+this.experience+" Salary: "+this.salary+" )");
	}

	// display the whole display
	void display_list()
	{
		Employee x = this;
		while(x != null)
		{
			x.display();
			System.out.println();
			x = x.next;
		}
	}

	// update based on experience
	void update()
	{
		Employee x = this;
		while(x != null)
		{
			if(x.experience > 10)
				x.salary += x.salary * 0.1;
			x = x.next;
		}
	}

	// insert some stuff
	void insert(Employee e)
	{
		Employee x = this;
		while(x.next != null)
			x = x.next;
		x.next = e;
	}

	// delete some stuff
	void delete(int code)
	{
		Employee x = this;

		while(x.next != null && x.next.code != code)
			x = x.next;

		if(x.next != null)
			x.next = x.next.next;
	}

	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in);

		System.out.print("Enter how may employee: ");
		int t = sc.nextInt();

		// head of the list so nothing to store here
		Employee e = new Employee(null, -1, 0, 0);

		for(int i = 0; i < t; i++)
		{
			System.out.println("Enter employee "+(i+1)+" details: ");
			String name = sc.next();
			int code = sc.nextInt();
			int experience = sc.nextInt();
			double salary = sc.nextDouble();

			e.insert(new Employee(name, code, experience, salary));
		}

		System.out.println("Fire and employee: ");
		int code = sc.nextInt();
		e.delete(code);

		System.out.println("Employee Details: ");
		e.update();
		e.display_list();
	}
}

#include <stdio.h>
#include <stdlib.h>

int partition(int *array, int start, int end)
{
	int pivot = array[(start + end)/2];

	while(end > start)
	{
		if (array[end] > pivot) end--;
		else if (array[start] < pivot) start++;
		else
		{
			int t = array[end];
			array[end] = array[start];
			array[start] = t;
		}
	}

	return start;
}

void print(int *i, int len)
{
	for(int indx = 0; indx < len; indx++)
		printf("%d ", i[indx]);
	puts("");
}

void quicksort(int *array, int start, int end)
{
	if(end <= start) return;

	int p = partition(array, start, end);

	print(array + start, end - start + 1);
	printf("pivot = %d\n", p);

	quicksort(array, start, p - 1);
	quicksort(array, p + 1, end);
}

int main(void)
{
	int a[] = {9, 8, 7, 6, 4, 3, 2, 1, 5};
	print(a, sizeof a / sizeof a[0]);
	quicksort(a, 0, sizeof a / sizeof a[0] - 1);
	print(a, sizeof a / sizeof a[0]);
	return 0;
}

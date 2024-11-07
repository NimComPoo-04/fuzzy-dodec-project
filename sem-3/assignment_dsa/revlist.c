#include <stdio.h>
#include <stdlib.h>

typedef struct list
{
	int key;
	struct list *next;
} list;

static list *head = NULL;

void createList(int key)
{
	if(head)
	{
		list *t = head;
		while(t->next)
			t = t->next;
		t->next = calloc(sizeof(*head), 1);
		t->next->key = key;
	}
	else
	{
		head = calloc(sizeof(*head), 1);
		head->key = key;
	}
}

void revereseList()
{
	list *prev = NULL;
	list *next = head;

	while(next)
	{
		list *tmp = next->next;
		next->next = prev;
		prev = next;
		next = tmp;
	}

	head = prev;
}

void displayList()
{
	list *t = head; 
	while(t)
	{
		printf("%d ", t->key);
		t = t->next;
	}
	puts("");
}

int main(void)
{
	for(int i = 1; i <= 10; i++)
		createList(rand() % 10);

	printf("Original list: ");
	displayList();

	// reversing the list 
	revereseList();

	printf("Reversed list: ");
	displayList();

	return 0;
}

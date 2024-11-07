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

void deleteList(int key)
{
	list **h = &head;

	while(h[0])
	{
		if(h[0]->key == key)
		{
			list *t = h[0];
			h[0] = h[0]->next;
			free(t);
		}
		else
		{
			h = &(h[0]->next);
		}
	}
}

int main(void)
{
	for(int i = 1; i <= 10; i++)
		createList(i);
	displayList();

	deleteList(5);
	displayList();

	deleteList(1);
	displayList();
}

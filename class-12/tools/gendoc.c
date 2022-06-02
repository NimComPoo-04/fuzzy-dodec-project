#include <stdio.h>
#include <stdlib.h>
#include <string.h>

////////// STRING HANDLING //////////

typedef struct
{
	char *value;
	size_t length;
} str_t;

// Prints the string
void str_prnt(str_t s)
{
	if(s.value == NULL) return;
	char c = s.value[s.length];
	s.value[s.length] = 0;
	printf(s.value);
	s.value[s.length] = c;
}

// string matcher
int str_match(str_t a, str_t b)
{
	if(a.value == NULL || b.value == NULL)
		return 0;

	if(a.length != b.length)
		return 0;

	for(size_t i = 0; i < a.length; i++)
		if(a.value[i] != b.value[i])
			return 0;
	return 1;
}

// Reads the file
str_t str_read_file(char *file)
{
	str_t data = {0};

	FILE *F = fopen(file, "r");

	fseek(F, 0, SEEK_END);
	data.length = ftell(F);
	fseek(F, 0, SEEK_SET);

	data.value = malloc(data.length+1);
	fread(data.value, sizeof(char), data.length, F);
	data.value[data.length] = 0;

	fclose(F);

	return data;
}

////////// SOURCE CODE PARSER (somewhat) //////////

enum
{
	ERR,	// things that we don't recognize

	LCT,	// line comment
	BCT,	// block comment
	DCT,	// documentation comment

	SYM,	// any ol' symbol this does include things cojugated with a .
	SEP,	// any ol' separator like ( ) or { } or ;
	STR,	// string

	PAREN	// block of paren like () and []
};

typedef struct
{
	int type;	// type of function
	str_t value;	// value lol
} element_t;

element_t *create_stream(str_t source, size_t *elements)
{
	*elements = 0;
	element_t *vec = NULL;

	for(size_t indx = 0; indx < source.length; indx++)
	{
		element_t e = {0} ;

		char c1 = 0;
		char c2 = 0;

		switch(source.value[indx])
		{
			case 0:
			case ' ':
			case '\t':
			case '\n': break;

			case '/': if(strncmp(source.value + indx, "/**", 3) == 0)
				  {
					  e.type = DCT;
					  indx += 3;
					  e.value.value = source.value + indx;
					  while(indx < source.length && strncmp(source.value+indx, "*/", 2) != 0)
					  {
						  indx++;
					  }
					  e.value.length = source.value + indx - e.value.value;
					  indx += 1;
				  }
				  else if(strncmp(source.value + indx, "/*", 2) == 0)
				  {
					  e.type = BCT;
					  indx += 2;
					  e.value.value = source.value + indx;
					  while(indx < source.length && strncmp(source.value+indx, "*/", 2) != 0)
					  {
						  indx++;
					  }
					  e.value.length = source.value + indx - e.value.value;
					  indx += 1;
				  }
				  else if(strncmp(source.value + indx, "//", 2) == 0)
				  {
					  e.type = LCT;
					  indx += 2;
					  e.value.value = source.value + indx;
					  while(indx < source.length && source.value[indx] != '\n')
					  {
						  indx++;
					  }
					  e.value.length = source.value + indx - e.value.value;
				  }
				  break;

//			case '[': c1 = '['; c2 = ']'; goto A;
			case '(': c1 = '('; c2 = ')'; goto A;
A:
				  e.type = PAREN;
				  e.value.value = source.value + indx;
				  int k = 1; indx++;
				  while(indx < source.length && k)
				  {
					  if(source.value[indx] == c1) k++;
					  if(source.value[indx] == c2) k--;
					  indx++;
				  }
				  e.value.length = source.value + indx - e.value.value;
				  indx--;
				  break;

			case '"': e.type = STR;
				  indx++;
				  e.value.value = source.value + indx;
				  while(indx < source.length && source.value[indx] != '"')
					  indx++;
				  e.value.length = source.value + indx - e.value.value;
				  break;

			case '{':
			case '}':
	//		case '(':
	//		case ')':
	//		case ',':
			case '=':
			case ';': e.type = SEP;
				  e.value.value = source.value + indx;
				  e.value.length = 1; 
				  break; default:
				   // symbols
				   if((source.value[indx] >= 'a' && source.value[indx] <= 'z') ||
						   (source.value[indx] >= 'A' && source.value[indx] <= 'Z') ||
						   source.value[indx] == '$' || source.value[indx] == '_')
				   {
					   e.type = SYM;
					   e.value.value = source.value + indx;
					   while((indx < source.length) &&
							   ((source.value[indx] >= 'a' && source.value[indx] <= 'z') ||
							    (source.value[indx] >= 'A' && source.value[indx] <= 'Z') ||
							    (source.value[indx] >= '0' && source.value[indx] <= '9') ||
							     source.value[indx] == '.'|| source.value[indx] == '$' ||
							     source.value[indx] == '_' || source.value[indx] == '[' ||
							     source.value[indx] == ']'))
					   {
						   indx++;
					   }
					   e.value.length = source.value + indx - e.value.value;
					   indx--;
				   }
		}

		if(e.value.value == 0 || e.value.length == 0)
			continue;

		if(*elements % 16 == 0)
			vec = realloc(vec, sizeof(element_t) * (*elements + 16));
		vec[(*elements)] = e;
		*elements = *elements + 1;
	}

	return vec;
}

void element_prnt(element_t e)
{
	printf("( %d : ", e.type);
	str_prnt(e.value);
	printf(" )");
}

void elements_prnt(element_t *e, size_t siz)
{
	for(size_t i = 0; i < siz; i++)
	{
		element_prnt(e[i]);
		puts("");
	}
}

///////////// Document Compilation ///////////

#define LIST_SIZE (100)

typedef struct
{
	str_t type;
	str_t name;
	str_t desc;
	str_t scope;
} lst_t;

typedef struct
{
	str_t value;
	str_t scope;
	int depth;
} slc_t;		// single line comments (for friends and family lol)

typedef struct
{
	str_t docs;	// main documentation comment

	lst_t variable[LIST_SIZE]; // variables declared
	int variable_len;

	slc_t comment[LIST_SIZE]; // comments declared
	int comment_len;

	str_t scope[LIST_SIZE]; // scopes present
	int scope_len;
} doc_t;

doc_t documentize(element_t *stream, size_t length)
{
	doc_t dx = {0};

	for(size_t i = 0; i < length; i++)
	{
		if(stream[i].type == DCT)
		{
			dx.docs = stream[i].value;
		}
		else if(stream[i].type == BCT || stream[i].type == LCT)
		{
			dx.comment[dx.comment_len].value = stream[i].value;
			dx.comment[dx.comment_len].scope = dx.scope[dx.scope_len-1];
			dx.comment_len++;
		}
		else if(stream[i].type == SEP && stream[i].value.value[0] == ';')
		{
			if(stream[i-1].type == SYM && stream[i-2].type == SYM)
			{
				if(!(strncmp(stream[i-2].value.value, "import", 6) == 0 ||
							strncmp(stream[i-2].value.value, "return", 6) == 0))
				{
					lst_t var = {stream[i-2].value, stream[i-1].value, (str_t){0, 0}, (str_t){0, 0}};
					if(dx.scope_len > 0)
					{
						var.scope = dx.scope[dx.scope_len-1];
					}
					if(dx.comment_len > 0)
					{
						var.desc = dx.comment[--dx.comment_len].value;
					}
					dx.variable[dx.variable_len++] = var;
				}
			}
		}
		else if(stream[i].type == SEP && stream[i].value.value[0] == '=')
		{
			if(stream[i-1].type == SYM && stream[i-2].type == SYM)
			{
				lst_t var = {stream[i-2].value, stream[i-1].value, (str_t){0, 0}, (str_t){0, 0}};
				if(dx.scope_len > 0)
				{
					var.scope = dx.scope[dx.scope_len-1];
				}
				if(dx.comment_len > 0)
				{
					var.desc = dx.comment[--dx.comment_len].value;
				}
				dx.variable[dx.variable_len++] = var;
			}
			while(stream[i].value.value[0] != ';')
				i++;
		}
		else if(stream[i].type == SEP && stream[i].value.value[0] == '{')
		{
			if(stream[i-1].type == PAREN && stream[i-2].type == SYM)
			{
				dx.scope[dx.scope_len++] = stream[i-2].value;
			}
			if(stream[i-1].type == SYM)
			{
				dx.scope[dx.scope_len++] = stream[i-1].value;
			}
		}
		else if(stream[i].type == SEP && stream[i].value.value[0] == '}')
		{
			dx.scope_len--;
		}
	}
	
	return dx;
}

void code_prnt(str_t s)
{
	if(s.value == NULL) return;
	for(size_t i = 0; i < s.length; i++)
	{
		// we don't need too much comment now do we lol
		if(strncmp(s.value+i, "/*", 2) == 0)
		{
			while(strncmp(s.value+i, "*/", 2) != 0)
				i++;
			i += 2;
		}

		putc(s.value[i], stdout);
		if(s.value[i] == '\n') printf(".br\n");
	}
}

void docs_prnt(str_t s)
{
	if(s.value == NULL) return;

	size_t i = 0;

	printf(".SH\n");
	printf(".DS C\n");
	printf(".LG\n");
	printf(".LG\n");
	printf(".LG\n");
	printf(".B\n");

	for(; i < s.length; i++)
	{
		if(s.value[i] == '.')
		{
			i++;
			break;
		}
		putc(s.value[i], stdout);
	}

	printf("\n\n");
	printf(".NL\n");
	printf(".DE\n");

	printf(".LP");

	for(; i < s.length-1; i++)
	{
		if(s.value[i] == '\n' && s.value[i+1] == '\n')
		{
			 printf("\n.br\n");
			 i+=2;
		}
		putc(s.value[i], stdout);
	}
}

// prints the document as groff lol
void document_prnt(doc_t *d, str_t source_code)
{
	printf("\n\n.nr PS 12500\n");
	docs_prnt(d->docs);
	printf("\n\n");

	printf("\n.bp\n");

	printf(".SH\n");
	printf(".DS C\n");
	printf(".LG\n");
	printf(".LG\n");
	printf(".B\n");
	printf("Algorithm\n");
	printf(".NL\n");
	printf(".DE\n");

	printf("\n.LP\n");

	int steps = 1;
	for(int i = 0; i < d->comment_len; i++)
	{
		if(i == 0 || !str_match(d->comment[i].scope, d->comment[i-1].scope))
		{
			if(i != 0)
				printf("Step %d:  End", steps);

			printf("\n.br\n");
			printf("\n.br\n");
			printf(".B ");
			str_prnt(d->comment[i].scope);
			printf("\n.br\n");

			steps = 1;
			printf("Step %d:  Start", steps);
			printf("\n.br\n");
			steps++;
		}
		printf("Step %d: ", steps);
		str_prnt(d->comment[i].value);
		printf("\n.br\n");

		steps++;
	}
	printf("Step %d:  End\n", steps);

	printf("\n.bp\n");

	printf(".SH\n");
	printf(".DS C\n");
	printf(".LG\n");
	printf(".LG\n");
	printf(".B\n");
	printf("Source Code\n");
	printf(".NL\n");
	printf(".DE\n");

	printf(".LP\n");
	printf(".SM\n");
	printf(".fam C\n");
	code_prnt(source_code);
	printf("\n.fam\n");
	printf(".NL\n");

	printf("\n.bp\n");

	printf(".SH\n");
	printf(".DS C\n");
	printf(".LG\n");
	printf(".LG\n");
	printf(".B\n");
	printf("Varible Listing\n");
	printf(".NL\n");
	printf(".DE\n");

	printf("\n.LP\n");

	printf(".TS\n");
	printf("expand center tab(|);\n");
	printf("- - - - -\n");
	printf("|cb |cb s| cb |cb|\n");
	printf("- - - - -\n");
	printf("|l |l s| l |l|.\n");
	printf("Name|Function|Type|Scope\n");
	for(int i = 0; i < d->variable_len; i++)
	{
		str_prnt(d->variable[i].name);
		printf("|T{\n");
		str_prnt(d->variable[i].desc);
		printf("\nT}|");
		str_prnt(d->variable[i].type);
		printf("|");
		str_prnt(d->variable[i].scope);
		printf("\n");
	}
	printf(".TE\n");
	printf("\n.bp\n");
}

///////////// Stuff ///////////

int main(int argc, char **argv)
{
	if(argc < 2) return 1;

	str_t data = str_read_file(argv[1]);
	if(data.value == NULL) return 2;

	size_t stream_size = 0;
	element_t *stream = create_stream(data, &stream_size);

	// elements_prnt(stream, stream_size);

	doc_t d = documentize(stream, stream_size);
	document_prnt(&d, data);
}

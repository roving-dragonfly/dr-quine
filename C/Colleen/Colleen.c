#include <stdio.h>

/*
  Characters needing to be escaped
*/
char quote = '"';
char backslash = '\\';

void print_data(char *str)
{
	printf("\t\t\"");
	for (int i = 0; str[i]; i++)
	{
		if (str[i] == quote || str[i] == backslash)
			putchar(backslash);
		putchar(str[i]);
	}
	printf("\",\n");
}

int main(void)
{
	char *data[] = {
		"#include <stdio.h>",
		"",
		"/*",
		"  Characters needing to be escaped",
		"*/",
		"char quote = '\"';",
		"char backslash = '\\\\';",
		"",
		"void print_data(char *str)",
		"{",
		"	printf(\"\\t\\t\\\"\");",
		"	for (int i = 0; str[i]; i++)",
		"	{",
		"		if (str[i] == quote || str[i] == backslash)",
		"			putchar(backslash);",
		"		putchar(str[i]);",
		"	}",
		"	printf(\"\\\",\\n\");",
		"}",
		"",
		"int main(void)",
		"{",
		"	char *data[] = {",
		NULL,
		"	};",
		"/*",
		"  Printing done in two halves",
		"*/",
		"	int i;",
		"	for (i = 0; data[i]; i++)",
		"		printf(\"%s\\n\", data[i]);",
		"	for (i = 0; data[i]; i++)",
		"		print_data(data[i]);",
		"	printf(\"\\t\\tNULL,\\n\");",
		"	int j = ++i;",
		"	for (; data[j]; j++)",
		"		print_data(data[j]);",
		"	printf(\"\\t\\tNULL\\n\");",
		"	for (; data[i]; i++)",
		"		printf(\"%s\\n\", data[i]);",
		"	return (0);",
		"}",
		NULL
	};
/*
  Printing done in two halves
*/
	int i;
	for (i = 0; data[i]; i++)
		printf("%s\n", data[i]);
	for (i = 0; data[i]; i++)
		print_data(data[i]);
	printf("\t\tNULL,\n");
	int j = ++i;
	for (; data[j]; j++)
		print_data(data[j]);
	printf("\t\tNULL\n");
	for (; data[i]; i++)
		printf("%s\n", data[i]);
	return (0);
}

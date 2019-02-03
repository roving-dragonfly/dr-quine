#define SULLY_N 5
#include <stdio.h>
#include <stdlib.h>

/*
  Characters needing to be escaped
*/
char quote = '"';
char backslash = '\\';

void print_data(FILE *file, char *str)
{
	fprintf(file, "\t\t\"");
	for (int i = 0; str[i]; i++)
	{
		if (str[i] == quote || str[i] == backslash)
			fprintf(file, "%c", backslash);
		fprintf(file, "%c", str[i]);
	}
	fprintf(file, "\",\n");
}

int main(void)
{
	char *data[] = {
		"#include <stdio.h>",
		"#include <stdlib.h>",
		"",
		"/*",
		"  Characters needing to be escaped",
		"*/",
		"char quote = '\"';",
		"char backslash = '\\\\';",
		"",
		"void print_data(FILE *file, char *str)",
		"{",
		"	fprintf(file, \"\\t\\t\\\"\");",
		"	for (int i = 0; str[i]; i++)",
		"	{",
		"		if (str[i] == quote || str[i] == backslash)",
		"			fprintf(file, \"%c\", backslash);",
		"		fprintf(file, \"%c\", str[i]);",
		"	}",
		"	fprintf(file, \"\\\",\\n\");",
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
		"	FILE *file;",
		"	int i;",
		"	char filename[128];",
		"	char bin[128];",
		"	char command[1024];",
		"",
		"	if (SULLY_N <= 0)",
		"		return (0);",
		"	sprintf(filename, \"Sully_%d.c\", (SULLY_N - 1));",
		"	if (!(file = fopen(filename, \"w\")))",
		"		return (0);",
		"	fprintf(file, \"#define SULLY_N %d\\n\", (SULLY_N - 1));",
		"	for (i = 0; data[i]; i++)",
		"		fprintf(file, \"%s\\n\", data[i]);",
		"	for (i = 0; data[i]; i++)",
		"		print_data(file, data[i]);",
		"	fprintf(file, \"\\t\\tNULL,\\n\");",
		"	int j = ++i;",
		"	for (; data[j]; j++)",
		"		print_data(file, data[j]);",
		"	fprintf(file, \"\\t\\tNULL\\n\");",
		"	for (; data[i]; i++)",
		"		fprintf(file, \"%s\\n\", data[i]);",
		"	fclose(file);",
		"	sprintf(bin, \"./Sully_%d\", (SULLY_N - 1));",
		"	sprintf(command, \"clang -Wall -Wextra -Werror %s -o %s && %s\", filename, bin, bin);",
		"	system(command);",
		"	return (0);",
		"}",
		NULL
	};
/*
  Printing done in two halves
*/
	FILE *file;
	int i;
	char filename[128];
	char bin[128];
	char command[1024];

	if (SULLY_N <= 0)
		return (0);
	sprintf(filename, "Sully_%d.c", (SULLY_N - 1));
	if (!(file = fopen(filename, "w")))
		return (0);
	fprintf(file, "#define SULLY_N %d\n", (SULLY_N - 1));
	for (i = 0; data[i]; i++)
		fprintf(file, "%s\n", data[i]);
	for (i = 0; data[i]; i++)
		print_data(file, data[i]);
	fprintf(file, "\t\tNULL,\n");
	int j = ++i;
	for (; data[j]; j++)
		print_data(file, data[j]);
	fprintf(file, "\t\tNULL\n");
	for (; data[i]; i++)
		fprintf(file, "%s\n", data[i]);
	fclose(file);
	sprintf(bin, "./Sully_%d", (SULLY_N - 1));
	sprintf(command, "clang -Wall -Wextra -Werror %s -o %s && %s", filename, bin, bin);
	system(command);
	return (0);
}

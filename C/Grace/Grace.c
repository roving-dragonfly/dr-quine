#include <stdio.h>
#define DATA \
	char *data[] = { \
		"#include <stdio.h>", \
		"#define DATA \\", \
		"	char *data[] = { \\", \
		NULL, \
		"	};", \
		"#define PRINT_DATA \\", \
		"	void print_data(FILE *file, char *str) \\", \
		"	{ \\", \
		"		char quote = '\"'; \\", \
		"		char backslash = '\\\\'; \\", \
		"		fprintf((file), \"\\t\\t\\\"\"); \\", \
		"		for (int i = 0; str[i]; i++) \\", \
		"		{ \\", \
		"			if (str[i] == quote || str[i] == backslash) \\", \
		"				fprintf((file), \"%c\", backslash); \\", \
		"			fprintf((file), \"%c\", str[i]); \\", \
		"		} \\", \
		"		fprintf((file), \"\\\", \\\\\\n\"); \\", \
		"	}", \
		"/*", \
		"  Same process as Colleen but with macros", \
		"*/", \
		"#define MAIN \\", \
		"	int main(){ \\", \
		"	DATA \\", \
		"	int i; \\", \
		"	FILE *file = fopen(\"./Grace_kid.c\", \"w\"); \\", \
		"	if (!file) \\", \
		"		return (1); \\", \
		"	for (i = 0; data[i]; i++) \\", \
		"		fprintf(file, \"%s\\n\", data[i]); \\", \
		"	for (i = 0; data[i]; i++) \\", \
		"		print_data(file, data[i]); \\", \
		"	fprintf(file, \"\\t\\tNULL, \\\\\\n\"); \\", \
		"	int j = ++i; \\", \
		"	for (; data[j]; j++) \\", \
		"		print_data(file, data[j]); \\", \
		"	fprintf(file, \"\\t\\tNULL \\\\\\n\"); \\", \
		"	for (; data[i]; i++) \\", \
		"		fprintf(file, \"%s\\n\", data[i]); \\", \
		"	return (0); \\", \
		"}", \
		"PRINT_DATA", \
		"MAIN", \
		NULL \
	};
#define PRINT_DATA \
	void print_data(FILE *file, char *str) \
	{ \
		char quote = '"'; \
		char backslash = '\\'; \
		fprintf((file), "\t\t\""); \
		for (int i = 0; str[i]; i++) \
		{ \
			if (str[i] == quote || str[i] == backslash) \
				fprintf((file), "%c", backslash); \
			fprintf((file), "%c", str[i]); \
		} \
		fprintf((file), "\", \\\n"); \
	}
/*
  Same process as Colleen but with macros
*/
#define MAIN \
	int main(){ \
	DATA \
	int i; \
	FILE *file = fopen("./Grace_kid.c", "w"); \
	if (!file) \
		return (1); \
	for (i = 0; data[i]; i++) \
		fprintf(file, "%s\n", data[i]); \
	for (i = 0; data[i]; i++) \
		print_data(file, data[i]); \
	fprintf(file, "\t\tNULL, \\\n"); \
	int j = ++i; \
	for (; data[j]; j++) \
		print_data(file, data[j]); \
	fprintf(file, "\t\tNULL \\\n"); \
	for (; data[i]; i++) \
		fprintf(file, "%s\n", data[i]); \
	return (0); \
}
PRINT_DATA
MAIN

%{
#include <cstdio>
extern int yylex();
extern int yylineno;
void yyerror(const char *s) { fprintf(stderr, "Error en linea %d: %s\n", yylineno, s); }
%}

%union {
	char* str;
}

%token PROGRAMA
%token <str> ID

%%
programa : PROGRAMA ID ';'   { printf("Prorama '%s' aceptado\n", $2); };
%%

%{
#include <cstdio>
extern int yylex();
extern int yylineno;
void yyerror(const char *s) { fprintf(stderr, "Error en linea %d: %s\n", yylineno, s); }
%}

%union {
	char* str;
	int   ent;
        float flot;
}

%token PROGRAMA VARS INICIO FIN
%token ENTERO FLOTANTE NULA
%token ESCRIBE SI SINO MIENTRAS HAZ

%token <str>  ID
%token <ent>  CTE_ENT
%token <flot> CTE_FLOT
%token <str>  LETRERO

%token DISTINTO IGUAL


%%
programa : PROGRAMA ID ';'   { printf("Prorama '%s' aceptado\n", $2); };
%%

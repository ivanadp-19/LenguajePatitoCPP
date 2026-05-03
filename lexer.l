%{
#include "parser.tab.h"
#include <cstdlib>
#include <cstring>
%}

%option noyywrap
%option yylineno

%%
"programa" {return PROGRAMA;}
[A-Za-z][A-Za-z0-9]* {yylval.str = strdup(yytext); return ID; }
";" { return ';'; }
[ \t\n\r]+ ;
.  { fprintf(stderr, "Linea %d: caracter no reconocido '%c' \n", yylineno, *yytext); }
%%


%{
#include "parser.tab.h"
#include <cstdlib>
#include <cstring>
%}

%option noyywrap
%option yylineno

%%
"programa" {return PROGRAMA;}
"vars" { return VARS;}
"inicio" {return INICIO; }
"fin" {return FIN;}
"entero" { return ENTERO; }
"flotante" {return FLOTANTE; }
"nula" {return NULA;}
"escribe" { return ESCRIBE; }
"si" { return SI; }
"sino" { return SINO; }
"mientras" { return MIENTRAS; }
"haz" { return HAZ; }


[0-9]+\.[0-9]+ { yylval.flot = atof(yytext); return CTE_FLOT; }
[0-9]+  { yylval.ent = atoi(yytext); return CTE_ENT; }

\"[^\"\n]*\" {yylval.str = strdup(yytext); return LETRERO; }


[A-Za-z][A-Za-z0-9]* {yylval.str = strdup(yytext); return ID; }

"!=" {return DISTINTO;}
"==" {return IGUAL; }

"=" { return '='; }
"+" { return '+'; }
"-" { return '-'; }
"*" { return '*'; }
"/" { return '/'; }
">" { return '>'; }
"<" { return '<'; }
"(" { return '('; }
")" { return ')'; }
"{" { return '{'; }
"}" { return '}'; }
";" { return ';'; }
"," { return ','; }
":" { return ':'; }

[ \t\n\r]+ ;

.  { fprintf(stderr, "Linea %d: caracter no reconocido '%c' \n", yylineno, *yytext); }

%%


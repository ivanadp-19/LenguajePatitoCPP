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
programa : PROGRAMA ID ';' vars_opt funcs_list INICIO cuerpo FIN
  	 { printf("Prorama '%s' aceptado\n", $2); }
  	 ;
vars_opt : vars_block
	 |
	 ;
funcs_list :  funcs funcs_list
	   |
	   ;
vars_block : VARS decl decl_list
	   ;
decl_list : decl decl_list
	  |
	  ;
decl : id_list ':' tipo ';'
     ;
id_list : ID id_list_p
	;
id_list_p : ',' ID id_list_p
	  |
	  ;
tipo : ENTERO
     | FLOTANTE
     ;
funcs : ret_tipo ID '(' param_list_opt ')' '{' vars_opt cuerpo '}' ';'
      ;
ret_tipo : NULA
	 | tipo
	 ;
param_list_opt : param param_list_p
               |
               ;
param_list_p : ',' param param_list_p
             |
             ;
param : ID ':' tipo
      ;

cuerpo : '{'estatuto_list'}'
       ;
estatuto_list : estatuto estatuto_list
              |
              ;
estatuto : asigna
	 | llamada_stmt
	 | imprime
	 | condicion
	 | ciclo
	 | '(' estatuto ')'
	 ;
asigna : ID '=' expresion ';'
       ;
llamada_stmt : ID '(' args_opt ')' ';'
	     ;
args_opt : expresion args_p
	 |
	 ;
args_p : ',' expresion args_p
       |
       ;
imprime : ESCRIBE '(' imp_arg imp_arg_list ')' ';'
	;
imp_arg_list : ',' imp_arg imp_arg_list
	     |
	     ;

imp_arg : expresion
	| LETRERO
	;
expresion : exp rel_opt
          ;

rel_opt : op_rel exp
        |
        ;

op_rel : '>'
       | '<'
       | DISTINTO
       | IGUAL
       ;

exp : termino exp_p
    ;

exp_p : '+' termino exp_p
      | '-' termino exp_p
      |
      ;

termino : factor termino_p
        ;

termino_p : '*' factor termino_p
          | '/' factor termino_p
          |
          ;

factor : '(' expresion ')'
       | signo_opt factor_atom
       ;

signo_opt : '+'
          | '-'
          |
          ;

factor_atom : CTE_ENT
            | CTE_FLOT
            | ID factor_idtail
            ;

factor_idtail : '(' args_opt ')'
              |
              ;
condicion : SI '(' expresion ')' cuerpo sino_opt ';'
          ;
sino_opt : SINO cuerpo
         |
         ;

ciclo : MIENTRAS '(' expresion ')' HAZ cuerpo ';'
      ;

%%


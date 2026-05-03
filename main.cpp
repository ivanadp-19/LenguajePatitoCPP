//
// Created by Felipe Alonzo on 03/05/26.
//
#include <cstdio>

extern FILE* yyin;
extern int yyparse();

int main(int argc, char** argv) {
    if (argc < 2) {
        fprintf(stderr, "uso: %s archivo.pat\n", argv[0]);
        return 1;
    }
    yyin = fopen(argv[1], "r");
    if (yyin == NULL) {
        fprintf(stderr, "Error al abrir archivo %s\n", argv[1]);
        return 1;
    }
    return yyparse();
}


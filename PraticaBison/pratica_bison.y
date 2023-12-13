%{
  #include <stdio.h>

  int yylex();
  int yyerror(const char *s);
%}

%token COMMAND STRING NUMBER

%%

command_list: /* empty */
            | command_list command
            ;

command: COMMAND STRING { printf("Comando PRINT válido: %s\n", $2); }
       | COMMAND NUMBER NUMBER { printf("Comando %s válido: %d %d\n", $1, $2, $3); }
       | COMMAND { yyerror("Erro: Argumentos faltando."); }
       | COMMAND STRING NUMBER { yyerror("Erro: Argumentos em ordem inválida."); }
       | COMMAND NUMBER STRING { yyerror("Erro: Argumentos em ordem inválida."); }
       | COMMAND NUMBER { yyerror("Erro: Argumentos faltando."); }
       | COMMAND STRING STRING { yyerror("Erro: Argumentos em ordem inválida."); }
       ;

%%
#include "lex.yy.c"

int main() {
    yyparse();
    return 0;
}

int yyerror(const char *s) {
    printf("%s\n", s);
    return 0;
}
/* O que é?
 * Flex:  "gerador" de analisador léxico.
 * Bison: "gerador" de analisador sintático.
 */

/* Para que serve?
 * Flex:  implementar autômatos.
 * Bison: implementar gramáticas.
 */

/* Download:
 * Flex: https://sourceforge.net/projects/gnuwin32/files/flex/2.5.4a-1/flex-2.5.4a-1.exe/download
 * Bison: http://downloads.sourceforge.net/gnuwin32/bison-2.4.1-setup.exe
 * GCC: baixar o DevC++ (https://www.bloodshed.net/) ou Code::Blocks (https://www.codeblocks.org/).
 */

/* Instalação:
 * Instalar o Flex e o Bison em uma pasta cujo 
 * caminho não possua espaços em branco.
 * Colocar as pastas "bin" do Flex, Bison e 
 * DevC++ (ou Code::Blocks) na variável "Path" do Windows.  
 */

/* Comandos para execução:
 * 1) flex analisador_lexico.l
 * 2) bison -d analisador_sintatico.y
 * 3) gcc lex.yy.c analisador_sintatico.tab.c -o prog
 * 4) ./prog
 */

/* Prólogo - Declarações:
 * Declarações = declarações auxiliares + definições regulares.
 */

 /* Declarações auxiliares:
  * Contém declaração global opcional, como 
  * importações, protótipo de função e 
  * variáveis globais.
  */
%{
  #include <stdio.h>

  int yylex();
  void yyerror(const char *s);
%}

/* Definições:
*  YACC definitions.
*/
%start cmd
%token MAIS MENOS MULT DIV NUM ID ATRIB PV ABREPAR FECHAPAR
%left ATRIB //Operador de precedência e associatividade.
%left MAIS MENOS
%left MULT DIV

/* Gramática:
 * Especificar as regras de produção e as ações (comados) 
 * a serem executados em cada uma delas.
 */
%%
cmd : ID ATRIB {printf("%c", $1);} expr PV {printf("%c", $2);
      printf("\n%d\n", $4);}
    ;

expr : expr MAIS termo  {$$ = $1 + $3; printf("%c", $2);}
     | expr MENOS termo {$$ = $1 - $3; printf("%c", $2);}
     | termo
     ;

termo : termo MULT fator {$$ = $1 * $3; printf("%c", $2);}
      | termo DIV fator  {$$ = $1 / $3; printf("%c", $2);}
      | fator
      ;

fator : ABREPAR expr FECHAPAR {$$ = $2;}
      | NUM                   {printf("%d", $1);}
      | ID                    {printf("%c", $1);}
      ;
%%

/* Epílogo - Código em C:
 * Código em C, implementação da tabela de símbolos
 * e funções associadas às regras de produção da 
 * gramática.
 */

#include "lex.yy.c"

int main(){
  yyparse();
  return(0);
}

void yyerror(const char *s) { 
  printf("\nERRO: %s.\n", s); 
}

int yywrap(){
  return 1; 
}

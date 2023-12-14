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
  #include "analisador_sintatico.tab.h"
  #include <stdlib.h>
%}

/* Definições regulares:
 * Consiste de símbolos e expressões regulares.
 */
delimitador      [ \t\n\r]
espaco_em_branco {delimitador}+
digito           [0-9]
numero           {espaco_em_branco}*{digito}+{espaco_em_branco}*
letra            [a-zA-Z]
identificador    {espaco_em_branco}*{letra}({letra}|{numero})*{espaco_em_branco}* 

/*Regras:*/
%%
"+"                {yylval = yytext[0]; return MAIS;}
"-"                {yylval = yytext[0]; return MENOS;}
"*"                {yylval = yytext[0]; return MULT;}
"/"                {yylval = yytext[0]; return DIV;}
"="                {yylval = yytext[0]; return ATRIB;}
";"                {return PV;}
"("                {return ABREPAR;}
")"                {return FECHAPAR;}
{numero}           {yylval = atoi(yytext); return NUM;}
{identificador}    {return ID;}
{espaco_em_branco} {/* Ignora espaços em branco.*/}
.                  {/* Ignora todo o resto.*/}
%%

/* Epílogo - Funções em Linguagem C:
 * Abaixo, informa-se funções auxiliares em 
 * linguagem C, caso seja necessário.
 */

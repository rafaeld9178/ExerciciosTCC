%{
	#include<stdio.h>
%}

%option noyywrap

DIGIT[0-9]+
LETTER[a-zA-Z
ID[a-zA-Z][a-zA-Z0-9]*
WHITESPACE[ ]
ABERTURA[(]
FECHAMENTO[)]

%%
if|else {printf("[%s] -> CONDICIONAL \n", yytext);}
for|while {printf("[%s] -> REPETICAO \n", yytext);}
int|float|double {printf("[%s] -> TIPO \n", yytext);}
main {printf("[%s] -> FUNCAO PRINCIPAL \n", yytext);}
#include {printf("[%s] -> ENTRADA DA BIBLIOTECA \n", yytext);}
printf {printf("[%s] -> FUNCAO DE SAIDA \n", yytext);}
return {printf("[%s] -> FUNCAO DE RETORNO \n", yytext);}
stdio.h {printf("[%s] -> BIBLIOTECA \n", yytext);}

"+" {printf("[%s] -> OPERADOR SOMA \n", yytext);}
"-" {printf("[%s] -> OPERADOR SUBTRACAO \n", yytext);}
"*" {printf("[%s] -> OPERADOR MULTIPLICACAO \n", yytext);}
"/" {printf("[%s] -> OPERADOR DIVISAO \n", yytext);}
"==" {printf("[%s] -> OPERADOR IGUALDADE \n", yytext);}
"++" {printf("[%s] -> OPERADOR INCREMENTO \n", yytext);}
">" {printf("[%s] -> OPERADOR MAIOR QUE \n", yytext);}
"<" {printf("[%s] -> OPERADOR MENOR QUE \n", yytext);}
">=" {printf("[%s] -> OPERADOR MAIOR OU IGUAL A \n", yytext);}
"<=" {printf("[%s] -> OPERADOR MENOR OU IGUAL A \n", yytext);}
"!=" {printf("[%s] -> OPERADOR DIFERENCA \n", yytext);}
"^" {printf("[%s] -> OU EXCLUSIVO \n", yytext);}
"||" {printf("[%s] -> OU LOGICO \n", yytext);}
"=" {printf("[%s] -> ATRIBUICAO \n", yytext);}
"{" {printf("[%s] -> ABRE CHAVES \n", yytext);}
"}" {printf("[%s] -> FECHA CHAVES \n", yytext);}
"." {printf("[%s] -> PONTO \n", yytext);}
";" {printf("[%s] -> PONTO E VIRGULA \n", yytext);}
"," {printf("[%s] -> VIRGULA \n", yytext);}

{ABERTURA} {printf("[%s] -> ABERTURA DE PARENTESES\n", yytext);}
{FECHAMENTO} {printf("[%s] -> FECHAMENTO DE PARENTESES\n", yytext);}
{DIGIT}+{ID}+ {printf("[%s] -> ERRO \n", yytext);}
{WHITESPACE} {printf("[%s] -> ESPACO EM BRANCO \n", yytext);}
{DIGIT} {printf("[%s] -> DIGITO \n", yytext);}
{ID} {printf("[%s] -> IDENTIFICADOR \n", yytext);}

[[:^space:]]+;

%%
int main(){
	yylex();
	return 0;
}

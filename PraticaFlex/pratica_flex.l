%{
	#include<stdio.h>
%}

%option noyywrap

DIGIT[0-9]+
LETTER[a-zA-Z]
STRING \".*\"
COMMAND SUB|ADD|PRINT
WHITESPACE[ ]

%%
{COMMAND} {printf("COMMAND -> %s\n", yytext);}
{STRING} {printf("STRING -> %s\n", yytext);}
{DIGIT} {printf("NUMBER -> %s\n", yytext);}
{WHITESPACE} {printf("[WHITESPACE]\n", yytext);}

[^[:space:]]+;

%%
int main(){
	yylex();
	return 0;
}
%{
	#include<stdio.h>
%}

%option noyywrap

DIGIT[0-9]+
LETTER[a-zA-Z]
COMMAND[SUB|ADD|PRINT]
WHITESPACE[ ]

%%
{COMMAND} {printf("COMMAND -> %s\n", yytext);}
".*" {printf("STRING -> [%s]\n", yytext);}

[^[:space:]]+;

%%
int main(){
	yylex();
	return 0;
}

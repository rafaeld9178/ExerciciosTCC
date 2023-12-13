%{
	#include<stdio.h>
%}

%option noyywrap

DIGIT[0-9]+
LETTER[a-zA-Z]
COMMAND SUB|ADD|PRINT
STRING \"[A-Za-z0-9 ]*\"
WHITESPACE[ ]

%%
{COMMAND} {printf("COMMAND -> %s\n", yytext); return COMMAND;}
{STRING} {printf("STRING -> [%s]\n", yytext); return STRING;}
{DIGIT} {printf("NUMBER -> [%s]\n", yytext); return NUMBER;}

[^[:space:]]+;

%%
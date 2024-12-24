/*Описать грамматику, позволяющую проводить трансляцию арифметических выражений, состоящих из целых чисел, знаков «+», «-», «*», «/» и скобок из инфиксной записи в постфиксную. */
%{
	#include <stdio.h>
	#include <string.h>
	#include <stdlib.h>
	#include "task3.tab.h"
//extern YYSTYPE yylval;
%}
%%
[0-9]+ {yylval= atoi(yytext); return NUMBER;}
"+"    {return PLUS;}
"-"    {return MINUS;} 
"*"    {return MUL;} 
"/"    {return DIV;} 
"("    {return OPEN;} 
"\n"   {return END;} 
")"    {return CLOSE;} 
.      {printf("Error:\n");}
%%
int yywrap() {
    return 1;
}

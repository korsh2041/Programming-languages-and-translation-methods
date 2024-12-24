%{
    #include <stdio.h>
    #include <string.h>
    #include <stdlib.h>
    #include "lab3task2.tab.h"
%}
/* Описать грамматику, позволяющую вычислять значения арифметических выражений, состоящих из целых чисел и знаков «+» и «-» */
%%
[0-9]+  {yylval.num=atoi(yytext); return NUMBER;}
"+" {return PLUS;}
"-" {return MINUS;}
\n  {return EOL;}
. {printf("Error:\n");}
%%
int yywrap(){
}

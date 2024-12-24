%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
int yylex();
int yyerror( char *s);
%}
/* Описать грамматику, позволяющую вычислять значения арифметических выражений, состоящих из целых чисел и знаков «+» и «-» */
%token EOL
%token NUMBER
%token PLUS MINUS
%%
input:
|    line input;
line:
    exp EOL {printf("%d\n",$1);}
|   EOL;
exp:
    NUMBER {$$=$1;}
|   exp PLUS NUMBER {$$=$1+$3;}
|   exp MINUS NUMBER {$$=$1-$3;};
%%
int main(){
    yyparse();
    return 0;
}
int yyerror( char *s){
    printf("ERROR:%s\n",s);
    return 0;
}

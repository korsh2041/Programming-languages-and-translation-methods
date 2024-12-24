%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
int yylex();
int yyerror( char *s);
%}

/* Описать грамматику, позволяющую вычислять значения арифметических выражений, состоящих из целых чисел и знаков «+» и «-» */
%token EOL NUMBER PLUS MINUS

%%
input:
|    line input;
line:
    exp EOL {printf("%d\n",$1);}
|   EOL;
exp:
	tok
|   exp PLUS tok {$$=$1+$3;}
|   exp MINUS tok {$$=$1-$3;};
tok:
	NUMBER {$$ = $1;}
%%
int main(){
    yyparse();
    return 0;
}
int yyerror( char *s){
    printf("ERROR:%s\n",s);
    return 0;
}

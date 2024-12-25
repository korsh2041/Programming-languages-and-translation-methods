%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
int yyparse();
int yylex(void);
void yyerror(const char *str){
        fprintf(stderr,"ошибка: %s\n",str);
}
int yywrap(){
        return 1;
} 
int main(){
		printf("Введите арифметическое выражение:\n");
        yyparse();
}
%}

%union{
	double flo;
	int in;
};

%token <flo> NUMBERVESH
%token <in> NUMBERSELO
%token PLUS MINUS MUL DIV OPEN CLOSE END

%%
command: 
	| command exp END { printf("\n"); } 
;
exp: factor
	| exp PLUS factor { printf("+ "); }
	| exp MINUS factor { printf("- "); }
;
factor: term
	| factor MUL term { printf("* "); }
	| factor DIV term { printf("/ "); }
;
term: 
	number
	| OPEN exp CLOSE{ ;}
number:
	NUMBERVESH { printf("%.2f ",$1); }
	| NUMBERSELO { printf("%d ", $1);}
;
%%

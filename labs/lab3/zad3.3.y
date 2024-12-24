%%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
void yyerror(const char *str);
int yylex();
void print_postfix(const char *str) {
    printf("%s ", str);
}
%}
%token NUMBER
%token PLUS MINUS MUL DIV END
%token OPEN CLOSE
%%
command: %empty
	 |command exp END { printf(" " ); }
    ;
exp:
    factor
    | exp PLUS factor {
        printf("+ ");
    }
    | exp MINUS factor {
        printf("- ");
    }
    ;
factor:
    term 
    | factor MUL term {
        printf("* ");
        }
    | factor DIV term {
            printf("/ ");
        }
    ;
term:
    NUMBER {
        printf("%d ", $1);
    }
    | OPEN exp CLOSE { 
    }
    ;
%% 
void yyerror(const char *str) {
    fprintf(stderr, "Ошибка: %s\n", str);
}

int main() {
    printf("Введите арифметическое выражение:\n");
    yyparse();
    
}

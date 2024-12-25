%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "y.tab.h"
%}
%%
[0-9]+			{yylval.in=atoi(yytext); return NUMBERSELO;}
[0-9]+[\.]?[0-9]* { yylval.flo= atof(yytext);return NUMBERVESH; }
"+" {return PLUS;}
"-" {return MINUS;}
"*" {return MUL;}
"/" {return DIV;}
"(" {return OPEN;}
")" {return CLOSE;}
\n  {return END;}
%%

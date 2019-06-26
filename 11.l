%{
#include<stdio.h>
#include"y.tab.h"
int yylval;
#include<ctype.h>
%}
%%
[a-zA-Z][a-zA-Z0-9]* {return ID;}
[0-9]+  {return num;}
[\t]
. {return yytext[0];}
[\n] {return 0;}
[ ] {return 0;}
%%
int yywrap()
{
return 1;
}

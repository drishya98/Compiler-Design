%{
#include<stdio.h>
#include "y.tab.h"
extern int yylval;
int val;
%}
%%
[a-zA-Z][a-zA-Z0-9]* {printf("Enter value of %s\n", yytext); scanf("%d", &val); yylval=val; return id;}
[0-9]+ {yylval=atoi(yytext); return num;}
[\t]
[\n] {return 0;}
. {return yytext[0];}
%%
int yywrap(){
return 1;
}

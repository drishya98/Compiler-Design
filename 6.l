%{
#include<stdio.h>
#include<ctype.h>
#include "y.tab.h"
int val;
extern int yylval;
%}

%%
[a-zA-Z][a-zA-Z0-9-]* {printf("Enter the value of %s\n",yytext);scanf("%d",&val);yylval=val;return id;}
[0-9]+ {yylval=atoi(yytext);return num;}
. {return yytext[0];}
[\n\t] {return 0;}
%%

int yywrap() {return 1;}

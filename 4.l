%{
#include<stdio.h>
int c=0;
FILE *fp;
%}
id [a-zA-Z][a-zA-Z0-9]*
op "{"
cl "}"
type "int"|"float"|"char"
%%
\n {c++;}
"struct"" "{id}{op}({type}" "{id}(","{id})*";")+{cl}";" {ECHO; printf("\tValid structure declaration in line: %d\n", c+1);}
"struct"" "{id}{op}{type}" "{id}(","{id})*{cl}";" {ECHO; printf("\tMissing semi-colon inside structure declaration in line: %d\n", c+1);}
"struct"" "{id}{op}{cl}";" {ECHO; printf("\tEmpty structure declaration in line: %d\n", c+1);}
"struct"" "{id}{op}.*{cl} {ECHO; printf("\tMissing semi-colon in structure declaration in line: %d\n", c+1);}
"struct"{op}.*{cl}";" {ECHO; printf("\tMissing name in structure declaration in line: %d\n", c+1);}
. ;
%%
int main(){
yyin = fopen("4.txt", "r");
yylex();
fclose(yyin);
}

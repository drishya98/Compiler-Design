%{
#include<stdio.h>
int c=0;
FILE *fp;
%}
id [a-zA-Z][a-zA-Z0-9]*
num [0-9]+
ar [-+*/%]
re ((<)|(<=)|(>)|(>=)|(==)|(!=))
un (("++")|("--"))
%%
\n {c++;}
{id}"="({id}|{num})({ar}({id}|{num}))+ {ECHO; printf(" Valid arithmetic expression in line number: %d\n", c+1);}
{id}"="({id}|{num}){ar} {ECHO; printf(" Missing right operand in arithmetic expression in line number: %d\n", c+1);}
{id}"="{ar}({id}|{num}) {ECHO; printf(" Missing left operand in arithmetic expression in line number: %d\n", c+1);}
{id}"="({id}|{num}){ar}+({id}|{num}) {ECHO; printf(" Consecutive operators in arithmetic expression in line number: %d\n", c+1);}
{id}"="({id}|{num}){re}({id}|{num}) {ECHO; printf(" Valid relational expression in line number: %d\n", c+1);}
{id}"="({id}|{num}){re} {ECHO; printf(" Missing right operand in relational expression in line number: %d\n", c+1);}
{id}"="{re}({id}|{num}) {ECHO; printf(" Missing left operand in relational expression in line number: %d\n", c+1);}
{id}"="({id}|{num}){re}+({id}|{num}) {ECHO; printf(" Consecutive operators in relational expression in line number: %d\n", c+1);}
{id}"="{un}{id} {ECHO; printf(" Valid unary expression in line number: %d\n", c+1);}
{id}"="{un}{un}+{id} {ECHO; printf(" More than one consecutive operator in unary expression in line number: %d\n", c+1);}
{id}"="{un}{num} {ECHO; printf(" Invalid unary expression in line number as numbers can't be ++ or --: %d\n", c+1);}
. ;
%%
int main(){
yyin=fopen("3.txt", "r");
yylex();
fclose(yyin);
}

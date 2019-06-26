%{
#include<stdio.h>
#include<stdlib.h>
int flag=0;
%}
%token ID num
%%
S:L '=' R|R;
L: '*' R| ID| num;
R:L;
%%
main()
{
printf("enter the expression for the grammar \n S->L=R|R\nL->*R|ID|num\nR->L");
yyparse();
printf("valid expression\n");
}
int yyerror()
{
printf("Invalid expression\n");
exit(1);
}

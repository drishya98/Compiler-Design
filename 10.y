%{
#include<stdio.h>
%}
%token ID
%%
exp:exp exp '*';
exp:exp exp '+';
exp:'(' exp ')';
exp:ID;
%%
main()
{
printf("enter the expression for the grammar \n S-->SS+ | SS* | (S) | a");
yyparse();
printf("valid expression\n");
}
int yyerror()
{
printf("Invalid expression\n");
exit(1);
}

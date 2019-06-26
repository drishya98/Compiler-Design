%{
#include<stdio.h>
int flag=0;
%}
%token ID KEY COLON COMMA NUM
%%
stmt: list {printf("\n declration is validated!");}
;
list : KEY list
| list ',' list
| list ','',' {printf("Syntax error: consequtive commas used: invalid");exit(0);}
| list COL
| ID '[' NUM ']'
| ID '[' NUM '.'']' { printf("\n float number cant be the size of an array");exit(0);}
| ID '[' ID ']' {printf("\n Size of an array should be an integer"); exit(0);}
| ID '[' ID { printf("\n close bracket missing in array declration");exit(0);}
| ID '[' {printf("\n size of array should be given");exit(0);}
| ID
;
COL: COLON
| COLON COL {printf("\n Syntax error: consequtive semicolon are used : invalid");exit(0);}
;
%%
main()
{
printf(" Enter valid declaration\n");
yyparse();
}
yyerror()
{
printf(" Invalid statement\n");
exit(1);
}

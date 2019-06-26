%{
#include<stdio.h>
#include<stdlib.h>
%}
%token id num
%left '(' ')'
%left '+' '-'
%left '*' '/'
%nonassoc UMINUS
%%
S:M {printf("Valid expression \nValue of expression: %d\n", $$);}
;
M:E'>'E {$$=$1>$3;}
|E'>''='E {$$=$1>=$4;}
|E'<'E {$$=$1<$3;}
|E'<''='E {$$=$1<=$4;}
|E'=''='E {$$=$1==$4;}
|E'!''='E {$$=$1!=$4;}
;
E:E'+'T {$$=$1+$3;}
|E'-'T {$$=$1-$3;}
|T {$$=$1;}
;
T:T'*'F {$$=$1*$3;}
|T'/'F {if($3==0) {printf("Divison by 0\n"); exit(0);} else $$=$1/$3;}
|F {$$=$1;}
;
F:'('E')' {$$=$2;}
|id
|num
;
%%
int main(){
printf("Enter relational expression\n");
yyparse();
}
void yyerror(){
printf("Invalid expression\n");
exit(0);
}

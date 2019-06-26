%{
#include<stdio.h>

%}

%token id num 
%left '+' '-'
%left '/' '*' '%'
%left "++" "--"
%left '(' ')'
%nonassoc UMINUS

%%
stmt : exp {printf(" Valid\n");}
;
exp : '(' exp ')' 
| '+''+' exp {printf("Unary plus prefix");$$=$3+1;printf("Result=%d",$$);}
| exp '+''+' {printf("Unary plus postfix");printf("Result=%d",$$);$$=$3+1;}
| '-''-' exp {printf("Unary minus prefix");$$=$3-1;printf("Result=%d",$$);}
| exp '-''-' {printf("Unary minus postfix");printf("Result=%d",$$);$$=$3-1;}
| exp '+' exp {printf("Plus\t");$$=$1+$3;printf("Result=%d",$$);}
| exp '-' exp {printf("Minus\t");$$=$1-$3;printf("Result=%d",$$);}
| exp '*' exp {printf("Multiplication\t");$$=$1*$3;printf("Result=%d",$$);}
| exp '/' exp {printf("Division\t");if($3==0) printf("Division by zero"); else {$$=$1/$3;printf("Result=%d",$$);}}
| exp '%' exp {printf("Modulus\t");$$=$1%$3;printf("Result=%d",$$);}
| id
| num
;
%%

int main (){
printf("Enter an arithmetic expression\n");
yyparse();
}
int yyerror() {
printf("Invalid exp\n");
exit(1);
}

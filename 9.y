%{
#include<stdio.h>
#include<stdlib.h>
%}

%token id num 
%left '&' '|' '!'
%left '<' '>' "=" '#'
%left '+' '-'
%left '/' '*' '%'
%left "++" "--"
%left '(' ')'
%nonassoc UMINUS

%%
stmt : logexp {printf(" Valid\n");}
;
logexp : '(' logexp ')'
| logexp '&' '&' logexp {printf("AND\t");$$=$1&&$4;printf("Result=%d\n",$$);}
| logexp '|' '|' logexp {printf("OR\t");$$=$1||$4;printf("Result=%d\n",$$);} 
| '!' logexp {printf("NOT\t");$$=!$2;printf("Result=%d\n",$$);}
| relexp;
relexp : '(' relexp ')'
| relexp '<' relexp {$$=$1<$3;}
| relexp '>' relexp {$$=$1>$3;}
| relexp '>' '=' relexp {$$=$1>=$4;}
| relexp '<' '=' relexp {$$=$1<=$4;}
| relexp '=' '=' relexp {$$=$1==$4;}
| relexp '#' relexp {$$=$1!=$3;}
| exp
;
exp : '(' exp ')' 
| '+''+' exp {printf("Unary plus prefix");$$=$3+1;}
| exp '+''+' {printf("Unary plus postfix");}
| '-''-' exp {printf("Unary minus prefix");$$=$3-1;}
| exp '-''-' {printf("Unary minus postfix");}
| exp '+' exp {$$=$1+$3;}
| exp '-' exp {$$=$1-$3;}
| exp '*' exp {$$=$1*$3;}
| exp '/' exp {if($3==0) printf("Division by zero"); else $$=$1/$3;}
| exp '%' exp {$$=$1%$3;}
| id
| num
;
%%

int main (){
printf("Enter a logical expression\n");
yyparse();
}
int yyerror() {
printf("Invalid exp\n");
exit(1);
}

%{
#include<stdio.h>
extern int yylval;
%}

%token ID
%start S

%%
S : E {printf("RES = %d",$$);return 0;}
E : E '+' T {$$ = $1 + $3;}
| E '-' T {$$ = $1 - $3;}
| T {$$=$1;}
;
T : T '*' F {$$ = $1 * $3;}
| T '/' F {if($3==0){printf("Divide by 0 not allowed\n");} else{ $$ = $1 / $3;}}
| F 
;
F : ID {$$=$1;}
| '(' E ')' {$$=$2;}
;
%%

int main(void) {
    printf("Enter :\n");
    return yyparse();
}

int yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
    return 0;
}
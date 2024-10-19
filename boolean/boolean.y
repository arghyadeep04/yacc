%{
#include<stdio.h>
extern int yylval;
%}

%token ID
%start S

%%
S : E {printf("RES = %d\n",$$);return 0;}
E : E '|' T {$$ = $1 || $3;printf("%d OR %d = %d\n",$1,$3,$$);}
| T {$$=$1;}
;
T : T '&' F {$$ = $1 && $3;printf("%d AND %d = %d\n",$1,$3,$$);}
| F {$$=$1;}
;
F : ID {$$=$1;}
| '(' E ')' {$$=$2;}
| '!' F {$$=!($2);printf("NOT %d = %d\n",$2,$$);}
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

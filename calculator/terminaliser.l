%{
#include "calculator.tab.h"
#include<stdio.h>
%}

%%
[0-9]+ {yylval=atoi(yytext);return ID;}
"+"      { return '+'; }
"-"      { return '-'; }
"*"      { return '*'; }
"/"      { return '/'; }
"("      { return '('; }
")"      { return ')'; }
["\t"|" "]+    ; // Ignore whitespace
"\n"      { return 0; }
.        { /* Ignore other characters */ }
%%

yywrap(){
    return 1;
}
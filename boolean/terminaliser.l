%{
#include "boolean.tab.h"
#include<stdio.h>
%}

%%
"TRUE" {yylval=1;return ID;}
"FALSE" {yylval=0;return ID;}
"AND" {return '&';}
"OR" {return '|';}
"NOT" {return '!';}
"("      { return '('; }
")"      { return ')'; }
["\t"|" "]+    ; // Ignore whitespace
"\n"      { return 0; }
.        { /* Ignore other characters */ }
%%

yywrap(){
    return 1;
}

%token INTEGER VARIABLE 
%left '+' '-' 
%left '*' '/' 
 
%{
   int sym[26]; 
%} 

%%

program :
	program statement '\n' 
        |  
        ; 
 
statement: 
        expr                      { printf("%d\n", $1); } 
        | VARIABLE '=' expr       { sym[$1] = $3; } 
        ; 
 
expr: 
        INTEGER 
        | VARIABLE                { $$ = sym[$1]; } 
        | expr '+' expr           { $$ = $1 + $3; } 
        | expr '-' expr           { $$ = $1 - $3; } 
        | expr '*' expr           { $$ = $1 * $3; } 
        | expr '/' expr           { $$ = $1 / $3; } 
        | '(' expr ')'            { $$ = $2; } 
        ; 
 
%% 

/*
//#include "lex.yy.c"
 
int yyerror(char *s) { 
    printf("%s\n", s); 
    return 0; 
} 
 
int main(void) { 
    yyparse(); 
    return 0; 
} 
*/

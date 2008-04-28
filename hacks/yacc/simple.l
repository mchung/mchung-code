/*
lex simple.l
gcc lex.yy.cc -ll -o simple
*/

D	[0-9]
%%
if	printf("IF statement\n");
[a-z]+	printf("tag, value [%s]\n", yytext);
[0-9]+	printf("decimal number [%s]\n", yytext);
"++"	printf("unary op\n");
"+"	printf("binary op\n");

/*
Build instructions

Either
  lex simple.l
  gcc lex.yy.c -ll -o simple
Or
  LDFLAGS=-ll make simple
*/

D	[0-9]
%%
if	printf("IF statement\n");
[a-z]+	printf("tag, value [%s]\n", yytext);
{D}+	printf("decimal number [%s]\n", yytext);
"++"	printf("unary op\n");
"+"	printf("binary op\n");

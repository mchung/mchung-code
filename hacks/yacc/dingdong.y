/*
Build instructions

Lex
  lex dingdong.l

Yacc
  yacc -dv dingdong.y
  gcc y.tab.c -ly -ll -o dingdong
*/

%token DING DONG DELL
%%
rhyme	:	sound place
	;

sound	:	DING DONG
	;

place	:	DELL
	;

%% 
#include "lex.yy.c"


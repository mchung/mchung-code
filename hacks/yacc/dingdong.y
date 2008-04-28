/*
Build instructions

Either
  yacc -dv dingdong.y
  gcc y.tab.c -ly -ll
Or
  LDFLAGS=-ll make simple
*/
/*
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


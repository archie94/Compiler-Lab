%{
	#include <stdio.h>
	int i;
%}
keyword		(if|else|for|while|main|int|char|float|return|scanf|printf)
%%
{keyword}	{for(i=0;i<yyleng;i++)printf("%c",yytext[i]);}
[a-zA-Z]	{for(i=0;i<yyleng;i++)printf("%c",toupper(yytext[i]));}
[0-9]+		{for(i=0;i<yyleng;i++)printf("%c",yytext[i]);}
.		printf(" ");
%%
main()
{
yyin=fopen("basic.c","r");
yylex();
}

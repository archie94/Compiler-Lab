/* Convert identifiers to uppercase */
%{
	#include <stdio.h>
	int i;
%}
keyword		(if|else|for|while|main|int|char|float|return|scanf|printf)
%%
{keyword}	{for(i=0;i<yyleng;i++)printf("%c",yytext[i]);}
[a-z]	{for(i=0;i<yyleng;i++)printf("%c",toupper(yytext[i]));}
%%
main()
{
yyin=fopen("basic.c","r");
yylex();
}

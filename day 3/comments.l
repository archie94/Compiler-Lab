/* Remove single line and multi line comments and display the total number of comments deleted */
%{
#include <stdio.h>
int i=0,single=0,line=0,l=0,multi=0;
%}
%%
[/][/][^\n]+			{single++;}
[/][*]([^*]|(\*+[^"*/"]))*\*+\/	{for(i=0;i<yyleng;i++)
					{
						if(yytext[i]=='\n')line++;
					}
					l+=line;
					multi++;
				}

%%
int main()
{
	yyin=fopen("basic.c","r");
	yylex();
	printf("no of single line comments = %d\nno of multiline comments = %d\ntotal no of lines in comments = %d\n",single,multi,l+single);
	return 0;
} 

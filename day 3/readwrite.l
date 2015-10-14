/* Convert scanf to read and printf to write respectively */
%{
%}
%%
[a-z]+	{if(!strcmp(yytext,"scanf"))		fprintf(yyout,"%s","read");
	 else if(!strcmp(yytext,"printf"))	fprintf(yyout,"%s","write");
	 else					fprintf(yyout,"%s",yytext);
	}
%%
int main()
{
	yyin=fopen("basic.c","r");
	yyout=fopen("out.txt","w");
	yylex();
	return 0;
}

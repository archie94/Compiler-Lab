/* Remove tabs at the beginning of a line in a C code */
%{
int count=0,i=0;
%}
%%
[\n][\t]+	{count++;fprintf(yyout,"%c",'\n');}
%%
int main()
{
	yyin=fopen("basic.c","r");
	yyout=fopen("tabremoved.c","w");
	yylex();
	return 0;
}

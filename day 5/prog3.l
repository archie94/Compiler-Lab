//indent a c code 
%{
	int i,inside=0,count=0;
%}

%%
[\n]*['{'][\n]*	{fprintf(yyout,"\n");	for(i=0;i<count;i++)fprintf(yyout,"\t");
			fprintf(yyout,"{\n"); count++;
			for(i=0;i<count;i++) fprintf(yyout,"\t");
		}

[\n]*['}'][\n]*	{count--;fprintf(yyout,"\n"); for(i=0;i<count;i++) fprintf(yyout,"\t");
			fprintf(yyout,"}\n");	for(i=0;i<count;i++) fprintf(yyout,"\t");
		}
[';'][\n]*	{ if(!inside){	fprintf(yyout,";\n"); for(i=0;i<count;i++) fprintf(yyout,"\t");}
			else fprintf(yyout,";");	
		}
[\n]+	{}
[\t]+	{}
['(']		{inside++;fprintf(yyout,"(");}
[')']		{inside--;fprintf(yyout,")");}
['>'][\n]*	{fprintf(yyout,">\n");}

%%
main()
{
	yyin=fopen("indent.c","r");
	yyout=fopen("answer.c","w");
	yylex();
}
	

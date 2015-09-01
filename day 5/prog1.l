/* Count maximum level of indentation */ 
%{ #include <stdio.h>
	int count=0,maxCount=0,i=0;
%}

%%
[\n][\t]+	{count=0;printf("%s",yytext);for(i=0;i<yyleng;i++) if(yytext[i]=='\t')count++;
			if(count>maxCount) maxCount=count;}
%%

main()
{
	yyin=fopen("test.c","r");
	yylex();
	printf("maximum level of indentation is %d \n",maxCount);
}


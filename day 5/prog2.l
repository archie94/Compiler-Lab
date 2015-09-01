/* Format the lines containg from 60 to 70 characters. Count the number of lines in the text before and after formating */ 
%{
	#include <stdio.h>
	int i=0,count=0,iniL=0,finL=0;
%}


%%
[\n]+	{count=0;for(i=0;i<yyleng;i++)iniL++;
		finL++;
		fprintf(yyout,"\n");  }
[a-z A-Z 0-9 \.]	{count++; if(count>60)
					{ if(yytext[0]==' '||yytext[0]=='.'){fprintf(yyout,"%c\n",yytext[0]);count=0;finL++;}
						else fprintf(yyout,"%c",yytext[0]);}
				  else	fprintf(yyout,"%c",yytext[0]);
			}

%%

main()
{
	yyin=fopen("input.txt","r");
	yyout=fopen("output.txt","w");
	printf(" No. of lines in input file (marked by newline character ) is %d\n",iniL);
	printf(" No. of lines in output file (marked by newline character ) is %d\n",finL);
	yylex();
}


/* Format the lines containg from 60 to 70 characters. Count the number of lines in the text before and after formating */ 
%{
int iniL=0,finL=0,i=0,count=0;
%}
%%
[\n]+			{iniL+=yyleng;finL++;fprintf(yyout,"%c",'\n'); }
[' ']+			{count++;
				if(count>=60)
				{
					fprintf(yyout,"%c\n",' ');
					count=0;
					finL++;
				}
				else 
				fprintf(yyout,"%c",' ');
			}
[a-z A-Z 0-9 '.']	{count++; 
				if(count>60)
				{
					if(yytext[0]=='.')
					{
						fprintf(yyout,"%c\n",yytext[0]);
						count=0; 
						finL++;
					}
					else
					fprintf(yyout,"%c",yytext[0]);
				}
				else
				fprintf(yyout,"%c",yytext[0]);
			}
%%
int main()
{
	yyin=fopen("abc.txt","r");
	yyout=fopen("formatted.txt","w");
	yylex();
	printf("initial lines were %d\n",iniL);
	printf("final lines is %d\n",finL);
	return 0;
}

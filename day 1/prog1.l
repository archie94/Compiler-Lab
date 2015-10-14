/* count number of numbers,words,lines and number of words with more than 10 characters */
%{
int lines=0,words=0,numbers=0,x=0;
%}

%%
[0-9]+		numbers++;
[a-z]+		{words++; if(strlen(yytext)>10) x++; }
\n+		lines++;
%%

main(void)
	{
		yylex();
		printf("lines=%d\n",lines);
		printf("words=%d\n",words);
		printf("words with more than 10 characters =%d\n",x);
		printf("numbers=%d\n",numbers);
	}


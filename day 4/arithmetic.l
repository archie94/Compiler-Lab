/* Lec code to check if an arithmetic expression is valid 
or not*/
%{ #include<stdio.h>
	int state=0,stack=0,flag=1;;
%}
%%
[a-z]	{if(state==0 && stack>=0) state=1;
		else if((state==4||state==2)&&stack>=0) state=3;
		else flag=0;}
['(']	stack++;
[')'] 	stack--;
['=']	{if(state==1 && stack==0)state=2;
		else flag=0;}
[+|\-|*|/]	{if(state==2 && (yytext[0]=='-'||yytext[0]=='+')) state=4;
		else if(state==3 && stack>=0)state=4;
		else flag=0;}
%%
main()
{
yylex();
if(!flag ||state==4||stack!=0) printf("in");
printf("valid\n");
}


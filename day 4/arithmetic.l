/* Lec code to check if an arithmetic expression is valid 
or not*/
%{
int state=0,stack=0,flag=1;
%}


%%
[a-z]		{if(state==0 && stack>=0) state=1;
		 else if((state==4 || state==2) && stack>=0) state=3;
		 else flag=0;
		}
['=']		{if((state==1 ) && stack>=0) state=2;
		 else flag=0;
		}
[+|\-|*|/]	{if( (yytext[0]=='+'||yytext[0]=='-') && state==2 && stack>=0 ) state=4;
		 else if((state==1 || state==3)  && stack>=0) state=4;
		 else flag=0;
		}
['(']		{stack++; if(state!=2 && state!=4 && state!=0) flag=0;}
[')']		{stack--; if(state!=1 && state!=3) flag=0;}
%%

int main()
{
	yylex();
	if(!flag || state==4 || stack!=0) printf("in");
	printf("valid\n");
	//printf("flag=%d state=%d\n",flag,state);
	return 0;
}

%{
void yyerror (char *s);
int yylex();
int yyerrok;
int yyclearin ;

#include <stdio.h>     /* C declarations used in actions */
#include <stdlib.h>
#include <ctype.h>



int symbols[52];
int symbolVal(char symbol);
void updateSymbolVal(char symbol, int val);
int i = 0;

%}

/* Yacc definitions */


%union {int num; char id; char *pr;}         
%union {char *child;}

%start program

%token DODGE HEART STRENGTH HEALTH SCANNER PRINT BALLSPEED TEAM TIMESCORE GAMERESULT ACTION ROLE CREATE DIE AND WHILE IF ELSE ELSEIF EQ BE SE B S COMMENT CHANGE STARTGAME ENDGAME THEN OR SEMICOLON FUN RETURN AS IFPROVIDE OTHERWISE FUNNAME EQUIV IMPL NOT DDG BOOL

%token <num> INTEGER
%token <id> IDENTIFIER
%token <child> CHILDREN
%token <pr> STRING

%type <id> assignmentStatement
%type <num> exp term boolExpression
%type <num> boolStatement
%type <num> whileStatement

%%

/* descriptions of expected inputs     corresponding actions (in C) */



program: /* empty */
        | program statements program
        | STARTGAME program
        | ENDGAME                	{exit(EXIT_SUCCESS);}
	| error /*error handling*/

        ;


statements:
        creationStatement
    	| dieStatement
        | printnumberStatement
        | scannerStatement
        | IfElseStatement
        | IfElseifElseStatement
    	| IfProvideOtherwiseStatement
        | whileStatement
    	| asStatement
        | ifThenStatement
        | functionStatement
        | changeStatement
        | commentStatement
        | assignmentStatement
    	| actionStatement
    	| resultStatement
    	| printStringStatement
    	| boolStatement
    	| heartStatement
	| funStatement
	| DDGStatement

        ;


expression:
    	comparisonExpression
        | actionExpression
        | orExpression
        | andExpression
        | boolExpression
    
   
    ;


heartStatement:
     	HEART             		{ printf("HELLO :) <3\n"); }
   	;


printStringStatement:
    	PRINT STRING            	{ printf("Printing : %s\n",$2); }

    	;

printnumberStatement:
        PRINT term     			{printf("Printing %d\n", $2);}
        ;

assignmentStatement:
        IDENTIFIER '=' exp          	{ updateSymbolVal($1,$3); }
        ;

exp:
         term                         	{$$ = $1;}
        | exp '+' term              	{$$ = $1 + $3;}
        | exp '-' term              	{$$ = $1 - $3;}
        ;
term :
    	INTEGER                        	{$$ = $1;}
        | IDENTIFIER                	{$$ = symbolVal($1);}
        ;


boolExpression:
          term EQ term            	{ $$ = $1 == $3;}
        | term B term             	{ $$ = $1 > $3;}
        | term S term             	{ $$ = $1 < $3;}
        | term BE term            	{ $$ = $1 >= $3;}
        | term SE term            	{ $$ = $1 <= $3;}
	| term AND term			{ $$ = $1 && $3;}
	| term OR term			{ $$ = $1 || $3;}	

    ;



funStatement:
	FUN FUNNAME statements RETURN statements SEMICOLON  

	;

commentStatement:
        COMMENT
        ;

creationStatement:
        CREATE CHILDREN        			{printf("Created: %s\n", $2);}    
        | creationStatement ROLE numericType    
    	| CHILDREN AND CHILDREN '=' TEAM
        ;

dieStatement:
    	DIE CHILDREN         			{printf("Died: %s\n", $2);}
    	;



scannerStatement:
        SCANNER
        ;
    
changeStatement:
        CHANGE
        ;    


boolStatement:
    
     	INTEGER EQ INTEGER    		{ $$ = $1 == $3 ;
                    			if($$==1){
                                	printf("TRUE\n");
                                	}
                               		else{
                                	printf("FALSE\n");
                                	}
                			}
    	| INTEGER B INTEGER     	{ $$ = $1 > $3;
                    			if($$==1){
                                	printf("TRUE\n");
                                	}
                               		else{
                                	printf("FALSE\n");
                                	}
                			}
    	| INTEGER S INTEGER    		{$$ = $1 < $3;
                    			if($$==1){
                                	printf("TRUE\n");
                                	}
                               		else{
                                	printf("FALSE\n");
                                	}
                    			}
    	| INTEGER BE INTEGER   		{ $$ = $1 >= $3;
                    			if($$==1){
                                	printf("TRUE\n");
                                	}
                               		else{
                                	printf("FALSE\n");
                                	}
                			}
    	| INTEGER SE INTEGER    	{ $$ = $1 <= $3;
                    			if($$==1){
                                	printf("TRUE\n");
                                	}
                               		else{
                                	printf("FALSE\n");
                                	}
                			}
    	| INTEGER AND INTEGER    		{ $$ = $1 && $3;
                    			if($$==1){
                                	printf("TRUE\n");
                                	}
                               		else{
                                	printf("FALSE\n");
                                	}
                			}
    	| INTEGER OR INTEGER		    	{ $$ = $1 || $3;
                    			if($$==1){
                                	printf("TRUE\n");
                                	}
                               		else{
                                	printf("FALSE\n");
                                	}
                			}
    	| '(' boolStatement ')'    	{ $$ = $2;
                    			if($$==1){
                                	printf("TRUE\n");
                                	}
                               		else{
                                	printf("FALSE\n");
                                	}
                			}

    	;


actionStatement:
    	CHILDREN ACTION numericType
     	;


IfProvideOtherwiseStatement:
    	IFPROVIDE expression statements OTHERWISE statements
    	;

IfElseStatement:
        IF boolExpression exp ELSE exp SEMICOLON              { if($2==1){
                                            			printf("%d\n", $3);
                                               			}else {
                                               			printf("%d\n", $5);} }    
        ;

IfElseifElseStatement:
        IF expression statements elseifStatement ELSE statements
        ;

elseifStatement:
        | ELSEIF expression statements elseifStatement
        ;
    
ifThenStatement:
        IF expression THEN statements
        ;


functionStatement:
        CHILDREN ACTION
        | functionStatement numericType
        | ROLE numericType
        ;

asStatement:
        AS expression statements 

    	;	

DDGStatement: 
        DDG     {printf("Congratulations You Found The Secret Section!\n");
            printf("The Force Be With You!\n");};


whileStatement:
         WHILE term S term RETURN exp SEMICOLON        {printf("%d\n" , $$ = ($4-$2)*$6);}
 
        | WHILE term B term RETURN exp SEMICOLON       {printf("%d\n", $$ = ($2-$4)*$6);}
    
    	| WHILE term S term RETURN PRINT exp SEMICOLON {            while(i<$4-$2) {
                                        			printf("%d\n",$7);
                                        				i +=1;} 
                                        				i == 0;}
 
    	| WHILE term B term RETURN PRINT exp SEMICOLON {            while(i<$2-$4) {
                                        printf("%d\n",$7);
                                        i +=1;} i==0; }



actionExpression:
        CHILDREN ACTION
    	;


comparisonExpression:
        numericType assignmentOperator numericType
    	| IDENTIFIER assignmentOperator numericType
    	| CHILDREN numericType assignmentOperator CHILDREN numericType '+' numericType
    	| IDENTIFIER assignmentOperator IDENTIFIER
    
        ;

orExpression:
        BOOL OR BOOL
        ;

andExpression:
        BOOL AND BOOL
        ;

assignmentOperator :
        EQ | BE | SE | B | S
        ;



numericType: STRENGTH | HEALTH | BALLSPEED | INTEGER

    	;

resultStatement:
    	TEAM GAMERESULT AND TEAM GAMERESULT
    	| GAMERESULT

    	;



%%                     /* C code */


int computeSymbolIndex(char token)
{
    int idx = -1;
    if(islower(token)) {
        idx = token - 'a' + 26;
    } else if(isupper(token)) {
        idx = token - 'A';
    }
    return idx;
}

/* returns the value of a given symbol */
int symbolVal(char symbol)
{
    int bucket = computeSymbolIndex(symbol);
    return symbols[bucket];
}

/* updates the value of a given symbol */
void updateSymbolVal(char symbol, int val)
{
    int bucket = computeSymbolIndex(symbol);
    symbols[bucket] = val;
}

int main (void) {
    /* init symbol table */
    int i;
    for(i=0; i<52; i++) {
        symbols[i] = 0;
    }

    return yyparse ( );
}

void yyerror (char *s)
{
printf("Wrong Gramer\n");
}



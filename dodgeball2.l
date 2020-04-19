%{
#include "y.tab.h"
#include "string.h"
void yyerror (char *s);
int yylex();

%}


STARTGAME (STARTGAME)([^a-zA-Z0-9])
ENDGAME (ENDGAME)([^a-zA-Z0-9])
PRINT PRINT:
STRENGTH \([0-9]\)
HEALTH [0-9]+[h]
BALLSPEED \([0-9]\.?[0-9]\)
TEAM A|B
TIMESCORE [0-9]+[S]
GAMERESULT WIN|LOST|DRAW
ACTION THROWING|ESCAPING|CATCHING
ROLE THROWER|ESCAPER
SCANNER SCANNER:([^a-zA-Z0-9])
STRING  \".*\"
CHILDREN [A-Z]+
IDENTIFIER [a-zA-Z]
CREATE CREATE([^a-zA-Z0-9])
DIE DIE([^a-zA-Z0-9])
AND AND([^a-zA-Z0-9])
OR OR([^a-zA-Z0-9])
NOT NOT([^a-zA-Z0-9])
INTEGER [0-9]+
IF IF[^a-zA-Z0-9]
ELSE ELSE[^a-zA-Z0-9]
ELSEIF ELSEIF[^a-zA-Z0-9]
WHILE WHILE[^a-zA-Z0-9]
THEN THEN[^a-zA-Z0-9]
EQ ==
BE >=
SE <=
B >
S <
COMMENT [^a-zA-Z0-9]([//].+[//])[^a-zA-Z0-9]
CHANGE (CHANGE)([^a-zA-Z0-9])
SEMICOLON ;
FUN FUN([^a-zA-Z0-9])
HEART <3<3<3<3<3([^a-zA-Z0-9])
RETURN RETURN[^a-zA-Z0-9]
AS AS[^a-zA-Z0-9]
IFPROVIDE IFPROVIDE[^a-zA-Z0-9]
OTHERWISE OTHERWISE[^a-zA-Z0-9]
FUNNAME [a-z]+[:]
DDG DDGDDGDDGDDGDDGDDGDDGDDGDDGDDGDDG([^a-zA-Z0-9])
BOOL true|false

%%
"<=>"	{return EQUIV;}
=>	{return IMPL;}
{AS} {return AS;}
{FUNNAME} {return FUNNAME;}
{RETURN} {return RETURN;}
{FUN} {return FUN;}
{HEART} {return HEART;}
{STRENGTH} {return STRENGTH;}
{HEALTH} {return HEALTH ;}
{STRING} {yylval.pr = strdup(yytext); return STRING ;}
{PRINT} {return PRINT ;}
{SCANNER} {return SCANNER ;}
{BALLSPEED} {return BALLSPEED ;}
{TEAM} {return TEAM ;}
{TIMESCORE} {return TIMESCORE ;}
{GAMERESULT} {return GAMERESULT ;}
{ACTION} {return ACTION ;}
{ROLE} {return ROLE ;}
{CHILDREN} {yylval.child = strdup(yytext); return CHILDREN ;}
{CREATE} {return CREATE ;}
{DIE} {return DIE ;}
{INTEGER}  {yylval.num = atoi(yytext);return INTEGER;}
{WHILE} {return WHILE ;}
{IF} {return IF ;}
{IFPROVIDE} {return IFPROVIDE ;}
{OTHERWISE} {return OTHERWISE ;}
{ELSE} {return ELSE ;}
{ELSEIF} {return ELSEIF ;}
{THEN} {return THEN ;}
{EQ} {return EQ ;}
{BE} {return BE ;}
{SE} {return SE ;}
{B} {return B ;}
{S} {return S ;}
{AND} {return AND ;}
{OR} {return OR ;}
{NOT} {return NOT ;}
{COMMENT} {return COMMENT ;}
{IDENTIFIER} {yylval.id = yytext[0]; return IDENTIFIER;}
{STARTGAME} {return STARTGAME ;}
{ENDGAME} {return ENDGAME ;}
{CHANGE} {return CHANGE ;}
{SEMICOLON} {return SEMICOLON;}
[-+=]                  {return yytext[0];}
[ \t\n]                ;
{DDG} {return DDG;}


%%


int yywrap (void) {return 1;}


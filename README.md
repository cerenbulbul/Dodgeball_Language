# Programming Language ddg 

**Project Name:** Dodgeball

**Group Members:** Sevda Gülen - Ceren Bülbül

**How it runs?**

- make dodgeball
- ./dodgeball2 < example1.ddg
- ./dodgeball2 < example2.ddg

&nbsp;
&nbsp;
&nbsp;

1. [ Project's BNF Form ](#BNF)
   * [Blocks and Commands](#commands)
   * [Expressions](#expressions)
   * [Types](#types)
2. [ Explanation of the Sysntax ](#ExplanationSysntax)
3. [ Any design decisions you make ](#Design) 

&nbsp;
&nbsp;
<a name="BNF"></a>
## Project's BNF Form

&nbsp;
<a name="commands"></a>
### Blocks and Commands ###

* < program > : program < statements > program  |  **STARTGAME** program  |  **ENDGAME**  | error

*  < statement > : creationStatement | dieStatement | printnumberStatement | scannerStatement |  IfElseStatement | IfElseifElseStatement  |  IfProvideOtherwiseStatement  |  whileStatement  |  asStatement |  ifThenStatement  |  functionStatement |  changeStatement  |  commentStatement |  assignmentStatement  |  actionStatement  |  resultStatement  |  printStringStatement | boolStatement  |  heartStatement |  funStatement | DDGStatement

* < heartStatement > : **HEART**   

* < printStringStatement > :  **PRINT**  **STRING**

* < printnumberStatement > : **PRINT** term

* < assignmentStatement > : **IDENTIFIER** '=' exp 

* < boolExpression > : term **EQ** term  | term **B** term  | term **S** term   | term **BE** term | term **SE** term 	| term **AND** term		| term **OR** term

* < funStatement > : **FUN FUNNAME** statements **RETURN** statements **SEMICOLON**

* < commentStatement > : **COMMENT**

* < creationStatement > :  **CREATE CHILDREN**  | creationStatement **ROLE** numericType  | **CHILDREN AND CHILDREN** '=' **TEAM**

* < dieStatement > : **DIE CHILDREN**

* < scannerStatement ? : **SCANNER**

* < changeStatement > : **CHANGE**

* < boolStatement > : **INTEGER EQ INTEGER** | **INTEGER B INTEGER** | **INTEGER S INTEGER** | **INTEGER BE INTEGER** | **INTEGER SE INTEGER** | **INTEGER AND INTEGER** | **INTEGER OR INTEGER** | '(' boolStatement ')'

* < actionStatement > : **CHILDREN ACTION** numericType

* < IfProvideOtherwiseStatement > : **IFPROVIDE** expression statements **OTHERWISE** statements

* < IfElseStatement > : **IF** boolExpression exp **ELSE** exp **SEMICOLON**

* < IfElseifElseStatement > : **IF** expression statements elseifStatement **ELSE** statements

* < elseifStatement > : **ELSEIF** expression statements elseifStatement

* < ifThenStatement > : **IF** expression **THEN** statements

* < functionStatement > : **CHILDREN ACTION**  | functionStatement numericType | **ROLE** numericType

* < asStatement > : **AS** expression statements 

* < DDGStatement > : **DDG**

* < whileStatement > : **WHILE** term **S** term **RETURN** exp **SEMICOLON** |  **WHILE** term **B** term **RETURN** exp **SEMICOLON** | **WHILE** term **S** term **RETURN** **PRINT** exp **SEMICOLON** | **WHILE** term **B** term **RETURN PRINT** exp **SEMICOLON**

* < resultStatement > : **TEAM GAMERESULT AND TEAM GAMERESULT** | **GAMERESULT**

&nbsp;
<a name="expressions"></a>
### Expressions ###

* < expression > : comparisonExpression | | actionExpression | orExpression| andExpression | boolExpression

* < exp > : term |  exp '+' term  |  exp '-' term     

* < boolExpression > : term **EQ** term | term **B** term | term **S** term | term **BE** term | term **SE** term | term **AND** term	| term **OR** term

* < actionExpression > : **CHILDREN ACTION**

* < comparisonExpression > : numericType assignmentOperator numericType | **IDENTIFIER** assignmentOperator numericType | **CHILDREN** numericType assignmentOperator **CHILDREN** numericType '+' numericType | **IDENTIFIER** assignmentOperator **IDENTIFIER**

* < orExpression > : **BOOL OR BOOL**

* < andExpression > : **BOOL AND BOOL**

* < assignmentOperator > : **EQ** | **BE** | **SE** | **B** | **S**


&nbsp;
<a name="types"></a>
### Types ###

* < numericType > : **STRENGTH** | **HEALTH** | **BALLSPEED** | **INTEGER**

* < term >  : **INTEGER**  | **IDENTIFIER**


:arrow_right: Bold text is token.







&nbsp;
<a name="ExplanationSysntax"></a>
## Explanation of the Sysntax

:arrow_forward: First of all, to start writing code, **STARTGAME** should be written in ddg language. Also, **ENDGAME** should be written when your code runs out.

```
STARTGAME
//something//
ENDGAME
```

:arrow_forward: Comment process is written between 2 //.

:arrow_forward: There are several different ways you can create a child. You can create without specifying any feature, you can also create by specifying the team or role.

```
STARTGAME
CREATE SEVDA
CREATE CEREN ESCAPER(8)
ENDGAME
```
> Created: SEVDA 

> Created: CEREN

:arrow_forward: There are assignments. A number can be assigned to an identifier.

:arrow_forward: Any string or numeric expressions can be printed. But the formats of string and numerical expressions are different.

```
STARTGAME
a = 5
PRINT:"LET'S START GAME"
PRINT:a
ENDGAME
```

:arrow_forward: "AS" operation works like a loop. After the AS keyword, an expression followed by statements.

```
STARTGAME
s = 10
AS s > 2
  PRINT:"AS STATEMENT" 
  s = s+2
ENDGAME
```

:arrow_forward: The "IFPROVIDE - OTHERWISE" process is used to compare the characteristics of two children. After IFPROVIDE, expression statements must write. After OTHERWISE a statement must write.

```
STARTGAME
IFPROVIDE SEVDA CATCHING
  s = s +5
OTHERWISE
  SEVDA ESCAPING
ENDGAME
```

:arrow_forward: A child should die when its health is finished.

```
STARTGAME
DIE SEVDA
ENDGAME
```

:arrow_forward: Children have actions. These are THROWING, ESCAPING, CATCHING. Also, these actions can be numeric types. For example, Throwing takes float numeric type(ballspeed). However, escaping and catching dont take any numeric type.

```
STARTGAME
BOB THROWING(4.6)
ROBI ESCAPING
ENDGAME
```

:arrow_forward: There are keywords to identify the winner or the loser when the game is over. These are; WIN, WON and DRAW. These are used for Teams.

```
STARTGAME
IFPROVIDE a < b 
  B WIN AND A LOST
OTHERWISE
  DRAW
ENDGMAE
```

:arrow_forward: It detects Boolean operations.

```
STARTGAME 
3==3
4>=6
ENDGAME
```

:arrow_forward: There are IF-ELSE statements for numerical expressions. This is not used in the game.

```
STARTGAME
IF 3<6 3 ELSE 6
ENDGAME
```

:arrow_forward: There is WHILE statement for numerical expressions. This While operation usues with semicolon. This is not used in the game. 

```
STARTGAME
WHILE 3<7 RETURN PRINT:3;

i=5
s = 5
WHILE i<6 RETURN s+2;
ENDGAME
```

:arrow_forward: There is function statement. It can be used like method. The function statement has keywords. These are; FUN and a function name(it must be lowercase) and RETURN.

```
STARTGAME
FUN functionname: IF 2>3 2 ELSE 3; RETURN a = 3-2;
ENDGAME
```


<a name="Design"></a>
## Any design decisions you make

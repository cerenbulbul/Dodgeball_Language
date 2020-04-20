# Programming Language ddg 

**Project Name:** Dodgeball

**Group Members:** Sevda Gülen - Ceren Bülbül

**How it runs?**

- make dodgeball
- ./dodgeball < example1.ddg
- ./dodgeball < example2.ddg

&nbsp;
&nbsp;
&nbsp;

1. [ Project's BNF Form ](#BNF)
2. [ Explanation of the Sysntax ](#ExplanationSysntax)
3. [ Any design decisions you make ](#Design) 

&nbsp;
&nbsp;
<a name="BNF"></a>
## Project's BNF Form

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

### Types ###

* < numericType > : **STRENGTH** | **HEALTH** | **BALLSPEED** | **INTEGER**

* < term >  : **INTEGER**  | **IDENTIFIER**


:arrow_right: **Hint:** Bold text is token.







&nbsp;
<a name="ExplanationSysntax"></a>
## Explanation of the Sysntax


<a name="Design"></a>
## Any design decisions you make

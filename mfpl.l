/*
 *	Constant definitions (in octal, which is not required)
 * 	Must be distinct and non-zero
 */
%{

%}

/*
 *	Definitions of regular expressions
*/

WSPACE		[ \t\r]+

LO_ALPHA		[a-z]
HI_ALPHA		[A-Z]
ALPHA			{LO_ALPHA}|{HI_ALPHA}
DIGIT            [0-9]
ALPHANUM		{ALPHA}|{DIGIT}
UNDERSCORE		_

IDENT			({UNDERSCORE}|{ALPHA})({ALPHANUM}|{UNDERSCORE})*

NEG_INTCONST	"-"[0-9]+
POS_INTCONST	("+")?[0-9]+
INTCONST        {NEG_INTCONST}|{POS_INTCONST}

DOUBLE_QUOTE      \"
STRCONST         {DOUBLE_QUOTE}[^\"\n]*{DOUBLE_QUOTE} 

COMMENT           ";".*$      
/*
 *	Tokens
*/
%%

"("			{
			printf("TOKEN: LPAREN    LEXEME: %s\n", yytext);
			return T_LPAREN;
			}
")"			{
			printf("TOKEN: RPAREN    LEXEME: %s\n", yytext);
			return T_RPAREN;
			}
"+"			{
			printf("TOKEN: ADD       LEXEME: %s\n", yytext);
			return T_ADD;
			}
"-"			{
			printf("TOKEN: SUB       LEXEME: %s\n", yytext);
			return T_SUB;
			}
"*"			{
			printf("TOKEN: MULT      LEXEME: %s\n", yytext);
			return T_MULT;
			}
"/"			{
			printf("TOKEN: DIV       LEXEME: %s\n", yytext);
			return T_DIV;
			}
">"			{
			printf("TOKEN: GT        LEXEME: %s\n", yytext);
			return T_GT;
			}
">="			{
			printf("TOKEN: GE        LEXEME: %s\n", yytext);
			return T_GE;
			}
"<"			{
			printf("TOKEN: LT        LEXEME: %s\n", yytext);
			return T_LT;
			}
"<="			{
			printf("TOKEN: LE        LEXEME: %s\n", yytext);
			return T_LE;
			}
"="			{
			printf("TOKEN: EQ        LEXEME: %s\n", yytext);
			return T_EQ;
			}
"/="			{
			printf("TOKEN: NE        LEXEME: %s\n", yytext);
			return T_NE;
			}
"let*"		{
			printf("TOKEN: LETSTAR   LEXEME: %s\n", yytext);
			return T_LETSTAR;
			}
"if"			{
			printf("TOKEN: IF        LEXEME: %s\n", yytext);
			return T_IF;
			}
"lambda"		{
			printf("TOKEN: LAMBDA    LEXEME: %s\n", yytext);
			return T_LAMBDA;
			}
"print"		{
			printf("TOKEN: PRINT     LEXEME: %s\n", yytext);
			return T_PRINT;
			}
"input"		{
			printf("TOKEN: INPUT     LEXEME: %s\n", yytext);
			return T_INPUT;
			}
"t"			{
			printf("TOKEN: T         LEXEME: %s\n", yytext);
			return T_T;
			}
"nil"			{
			printf("TOKEN: NIL       LEXEME: %s\n", yytext);
			return T_NIL;
			}
"and"			{
			printf("TOKEN: AND       LEXEME: %s\n", yytext);
			return T_AND;
			}
"or"			{
			printf("TOKEN: OR        LEXEME: %s\n", yytext);
			return T_OR;
			}
"not"			{
			printf("TOKEN: NOT       LEXEME: %s\n", yytext);
			return T_NOT;
			}
"exit"		{
			printf("TOKEN: EXIT      LEXEME: %s\n", yytext);
			return T_EXIT;
			}
"progn"		{
			printf("TOKEN: PROGN      LEXEME: %s\n", yytext);
			return T_PROGN;
			}
"\n"  {
	    numLines = numLines + 1;
      }
{INTCONST}	     {
			printf("TOKEN: INTCONST  LEXEME: %s\n", yytext);
			return T_INTCONST;
			}
{STRCONST}	     {
			printf("TOKEN: STRCONST  LEXEME: %s\n", yytext);
			return T_STRCONST;
			}
{IDENT}		{
			printf("TOKEN: IDENT     LEXEME: %s\n", yytext);
			return T_IDENT;
			}
{WSPACE}		{ }
{COMMENT}		{ }
.			{
			printf("TOKEN: UNKNOWN   LEXEME: %s\n",
			       yytext);
			return T_UNKNOWN;
			}

%%




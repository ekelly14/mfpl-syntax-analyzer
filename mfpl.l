/*   example.l
 
	Example of a lex specification file.
     
	To create the lexical analyzer:

	flex example.l
	g++ lex.yy.c -o lexer
	lexer < inputFileName
*/

%{
  /* 
  Definitions of constants, variables, & function prototypes go here 
  */

  // These need to be NON-ZERO!
  #define T_IDENT   1
  #define T_INTCONST   2
	#define T_STRCONST   3
	#define T_PROGN   4
	#define T_LETSTAR   5
	#define T_LAMBDA   6
	#define T_INPUT   7
	#define T_PRINT   8
	#define T_IF   9

  #define T_ADD   10
  #define T_SUB   11
  #define T_MULT   12
  #define T_DIV   13
	#define T_AND   14
	#define T_OR   15
	#define T_NOT   16
	#define T_LT   17
	#define T_GT   18
	#define T_LE   19
	#define T_GE   20
	#define T_EQ   21   
	#define T_NE   22
	#define T_T   23
	#define T_NIL   24
  #define T_EXIT   25
	#define T_LPAREN   26
	#define T_RPAREN   27
	#define T_COMMENT  28

  #define T_UNKNOWN   	99

  int numLines = 0;

  void printTokenInfo(const char* tokenType, char* lexeme);

%}

/* Named defintions of regular expressions go here */

WSPACE		[ \t\v\r]+
NEWLINE		\n

DIGIT			[0-9]
LETTER		[a-zA-Z]

IDENT		({LETTER}|_)({LETTER}|{DIGIT}|_)*
INTCONST		(\+|\-)?{DIGIT}+

STRCONST \".*\"

%%

"exit"	{
		printTokenInfo("EXIT", yytext);
		return T_EXIT;
		}
;.*   {
	  return T_COMMENT;
}
"+"		{
		printTokenInfo("ADD", yytext);
		return T_ADD;
		}
"-"		{
		printTokenInfo("SUB", yytext);
		return T_SUB;
		}
"*"		{
		printTokenInfo("MULT", yytext);
		return T_MULT;
		}
"("   {
    printTokenInfo("LPAREN", yytext);
		return T_LPAREN;
    }
")"   {
	  printTokenInfo("RPAREN", yytext);
		return T_RPAREN;
    }
"/"		{
		printTokenInfo("DIV", yytext);
		return T_DIV;
		}
"and"   {
	  printTokenInfo("AND", yytext);
		return T_AND;
    }
"or"    {
    printTokenInfo("OR", yytext);
		return T_OR;
    }
"not"   {
	  printTokenInfo("NOT", yytext);
		return T_NOT;
    }
"<"   {
    printTokenInfo("LT", yytext);
		return T_LT;
    }
">"   {
	  printTokenInfo("GT", yytext);
		return T_GT;
    }
"<="   {
	  printTokenInfo("LE", yytext);
		return T_LE;
    }
">="   {
	  printTokenInfo("GE", yytext);
		return T_GE;
    }
"="   {
	  printTokenInfo("EQ", yytext);
		return T_EQ;
    }
"/="   {
	  printTokenInfo("NE", yytext);
		return T_NE;
    }
"t"   {
	  printTokenInfo("T", yytext);
		return T_T;
    }
"nil"   {
	  printTokenInfo("NIL", yytext);
		return T_NIL;
    }
"progn"   {
	  printTokenInfo("PROGN", yytext);
		return T_PROGN;
    }
"if"   {
	  printTokenInfo("IF", yytext);
		return T_IF;
    }
"print"   {
	  printTokenInfo("PRINT", yytext);
		return T_PRINT;
    }
"input"   {
	  printTokenInfo("INPUT", yytext);
		return T_INPUT;
    }
"lambda"   {
	  printTokenInfo("LAMBDA", yytext);
		return T_LAMBDA;
    }
"let*"   {
	  printTokenInfo("LETSTAR", yytext);
		return T_LETSTAR;
    } 
{INTCONST}	{
		printTokenInfo("INTCONST", yytext);
		return T_INTCONST;
		}
{IDENT}	{
		printTokenInfo("IDENT", yytext);
		return T_IDENT;
		}
{STRCONST} {
    printTokenInfo("STRCONST", yytext);
		return T_STRCONST;
    }
{NEWLINE}	{
		numLines++;
		}
{WSPACE}	{ }
.		{
		printTokenInfo("UNKNOWN", yytext);
		return T_UNKNOWN;
		}

%%

// User-written code goes here

void printTokenInfo(const char* tokenType, char* lexeme) 
{
  printf("TOKEN: %s  LEXEME: %s\n", tokenType, lexeme);
}

// You should supply a yywrap function.
// Having it return 1 means only 1 input file will be scanned.
int yywrap(void) { return 1; }

int main(void) 
{
  while ( yylex() ) ;  // Process tokens until 0 returned
  return 0;
}
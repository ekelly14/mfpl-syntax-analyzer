# mfpl-syntax-analyzer
Project for school. A lexical and syntax analyzer for the programming language MFPL, which is a simplified version of LISP. Uses the c++ tools Flex and Bison.

To compile, use:
flex mfpl.l
bison mfpl.y
g++ mfpl.tab.c -o mfpl_parser

where g++ is your c++ compiler.

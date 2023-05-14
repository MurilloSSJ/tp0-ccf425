%{ 

/*codigo colocado aqui aparece no arquivo gerado pelo flex*/ 

%} 

/* This tells flex to read only one input file */ 
%option noyywrap 

/* definicoes regulares */ 

delim		        [ \t\n]
space               [ ]{1}
ws		            {delim}+
if                  if
equal               ==
different           !=
greater             >
less                <
greater_equal       >=
less_equal          <=
operations          ({equal}|{different}|{greater}|{less}|{greater_equal}|{less_equal})
positive_number		(\+)?[0-9]+
negative_number     (\-)[0-9]+
decimal_number      ({positive_number}|{negative_number})\.[0-9]+
exp                 ({positive_number}|{negative_number}|{decimal_number})({space})?({operations})({space})?({positive_number}|{negative_number}|{decimal_number})
if_statement        {if}{space}{exp}\:
%% 

{ws}		{/*nenhuma acao e nenhum retorno*/}
{positive_number}		{printf("Foi encontrado um numero inteiro positivo. LEXEMA: %s\n", yytext);}
{negative_number}		{printf("Foi encontrado um numero inteiro negativo. LEXEMA: %s\n", yytext);}
{decimal_number}        {printf("Foi encontrado um numero decimal. LEXEMA: %s\n", yytext);}
{exp}                   {printf("Foi encontrado uma expressao. LEXEMA: %s\n", yytext);}
{if}                    {printf("Foi encontrado um if. LEXEMA: %s\n", yytext);}
{operations}            {printf("Foi encontrado um operador. LEXEMA: %s\n", yytext);}
{if_statement}          {printf("Foi encontrado um if statement. LEXEMA: %s\n", yytext);}





%% 

/*codigo em C. Foi criado o main, mas podem ser criadas outras funcoes aqui.*/ 

int main(void) 
{ 
    /* Call the lexer, then quit. */ 
    yylex();
    return 0; 
}

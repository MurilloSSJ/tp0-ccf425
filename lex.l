%{ 

/*codigo colocado aqui aparece no arquivo gerado pelo flex*/ 

%} 

/* This tells flex to read only one input file */ 
%option noyywrap 

/* definicoes regulares */ 

delim		        [ \t\n]
space               [ ]{1}
ws		            {delim}+
positive_number		(\+)?[0-9]+
negative_number     (\-)[0-9]+
decimal_number      ({positive_number}|{negative_number})\.[0-9]+
plate               [A-Z]{3}\-[0-9]{4}
word                [A-Za-z]+
phone               [0-9]{4}\-[0-9]{4}
name                ({word}{space}){2}({word}){1}({space}{word})?
%% 

{ws}		{/*nenhuma acao e nenhum retorno*/}
{positive_number}		{printf("Foi encontrado um numero inteiro positivo. LEXEMA: %s\n", yytext);}
{negative_number}		{printf("Foi encontrado um numero inteiro negativo. LEXEMA: %s\n", yytext);}
{decimal_number}        {printf("Foi encontrado um numero decimal. LEXEMA: %s\n", yytext);}
{plate}                 {printf("Foi encontrado uma placa. LEXEMA: %s\n", yytext);}
{phone}                 {printf("Foi encontrado um telefone. LEXEMA: %s\n", yytext);}
{name}                  {printf("Foi encontrado um nome proprio. LEXEMA: %s\n", yytext);}
{word}                  {printf("Foi encontrado uma palavra. LEXEMA: %s\n", yytext);}




%% 

/*codigo em C. Foi criado o main, mas podem ser criadas outras funcoes aqui.*/ 

int main(void) 
{ 
    /* Call the lexer, then quit. */ 
    yylex();
    return 0; 
}

%{
    int line_num = 0;
    int character_num = 0;
    int word_num = 0;
%}
line  [\n]
any [.]
letter [[a-z]|[A-Z]]
digit [0-9]
word  ({letter}|{digit})+
%%
{line}      {character_num++; line_num++;}
{word}      {character_num+=yyleng; word_num++;}
{any}       {character_num++; }
 
%%
int main() {
    yylex();
    printf("has characters: \t%d\n", character_num);
    printf("has words: \t%d\n", word_num);
    printf("has lines: \t%d\n", line_num); 
    getch();
}
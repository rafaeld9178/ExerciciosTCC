flex lexico.l
bison -d pratica_bison.y
gcc -o praticabison pratica_bison.tab.c
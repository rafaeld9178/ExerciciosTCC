#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void error(char *c, int s, int temp) {
    printf("(q%i, %c) -> Transicao invalida!", temp, c);
    printf("\n\nPalavra nao aceita: transicao invalida.\n");
}

int main() {
    char string[100];
    printf("Digite uma palavra: ");
    scanf("%s", string);
    printf("\n");
    int estado = 0;

    for (int i = 0; i < strlen(string); i++) { //enquanto o iterador for menor q a string, ele aumenta
        char atual = string[i];
        int temp = estado;
        if (atual != 'a' && atual != 'b') {
            error(atual, estado, temp);
            return 1; // erro
        }

        if (estado == 0) { //q0
            if (atual == 'a') {
                estado = 1;
            } else {
            error(atual, estado, temp);
            return 1; // erro
            }
        } else if (estado == 1) {
            if (atual == 'a') {
                estado = 1;
                // continua no estado 1
            } else {
                estado = 2;
            }
        } else if (estado == 2) {
            if (atual == 'a') {
                estado = 3;
            } else {
                estado = 2;
            }
        } else if (estado == 3) {
            if (atual == 'a') {
                estado = 3;
            } else {
                estado = 4;
                }
            }
         else if (estado == 4) {
            if (atual == 'b') {
                estado = 6;
            } else {
                error(atual, estado, temp);
                return 1; // erro
                }
        }
            else if (estado == 6) {
                if (atual == 'b') {
                    estado = 6;
                } else {
                    estado = 7;
                    }
            }
            else if (estado == 7) {
                if (atual == 'a') {
                    estado = 8;
                } else {
                    error(atual, estado, temp);
                return 1; // erro
                    }
            }
            else if (estado == 8) {
                if (atual == 'b') {
                    estado = 8;
                } else {
                    error(atual, estado, temp);
                return 1; // erro
                    }
            }
        printf("(q%i, %c) -> q%i\n", temp, atual, estado);
    }

    if (estado == 8) {
        printf("\nPalavra aceita.\n");
    } else {
        printf("\nPalavra nao aceita: nao chegou ao estado de aceitacao.\n");
    }
    return 0;

}

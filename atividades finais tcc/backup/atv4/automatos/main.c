#include <stdio.h>
#include <string.h>

// Função para verificar se a palavra é aceita ou não pelo AFD
int verificaPalavra(char palavra[]) {
    int estado = 0; // Estado inicial
    int i = 0;

    while (palavra[i] != '\0') {
        if (palavra[i] == '0') {
            if (estado == 0) {
                estado = 1; // Se o estado for 0 e encontrar um 0, vai para o estado 1
            } else if (estado == 1) {
                estado = 0; // Se o estado for 1 e encontrar um 0, volta para o estado 0
            }
        } else if (palavra[i] == '1') {
            if (estado == 0) {
                estado = 2; // Se o estado for 0 e encontrar um 1, vai para o estado 2
            } else if (estado == 2) {
                estado = 0; // Se o estado for 2 e encontrar um 1, volta para o estado 0
            }
        }
        i++;
    }

    // Se o estado final for 0, aceita a palavra
    return estado == 0;
}

int main() {
    char palavra[100]; // Tamanho máximo da palavra
    printf("Digite a palavra a ser verificada: ");
    scanf("%s", palavra);

    int aceita = verificaPalavra(palavra);

    if (aceita) {
        printf("A palavra foi aceita pelo AFD.\n");
    } else {
        printf("A palavra nao foi aceita pelo AFD.\n");
    }

    return 0;
}


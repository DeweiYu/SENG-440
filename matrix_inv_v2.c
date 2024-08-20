#include <stdio.h>
// #include <arm_neon.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdlib.h>
#include <limits.h>
#include <math.h>

/* SENG 440, Summer 2024 
Aaron Yee, V00962067
Leonard Yu, V00897211
Matrix Inversion using Gauss-Jordan Elimination
*/

#define N 4 // Dimension of the square matrix

void printMatrix(float matrix[N][N]) {
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            printf("%6.3f ", matrix[i][j]);
        }
        printf("\n");
    }
    printf("\n");
}

void gaussJordan(float matrix[N][N], float inverse[N][N]) {

    float temp;
    
    // Initializing the inverse
    for (int i = 0; i < N; i++) {
        inverse[i][i] = 1.0;
    }

    for (int i = 0; i < N; i++) {


        // Find the row with the maximum element in the current column
        int16_t maxRow = i;
        float maxVal = abs(matrix[i][i]);
        for (int k = i + 1; k < N; k++) {
            if (fabs(matrix[k][i]) > maxVal) {
                maxVal = abs(matrix[k][i]);
                maxRow = k;
            }
        }

        // // Swap the current row with the row of the maximum element
        if (maxRow != i) {
            for (int j = 0; j < N; j++) {
                temp = matrix[i][j];
                matrix[i][j] = matrix[maxRow][j];
                matrix[maxRow][j] = temp;

                temp = inverse[i][j];
                inverse[i][j] = inverse[maxRow][j];
                inverse[maxRow][j] = temp;
            }
        }



        temp = matrix[i][i];
        if (temp == 0) {
            printf("Matrix is singular and cannot be inverted.\n");
            exit(1);
        }



        // Normalizing pivot row
        for (int j = 0; j < N; j++) {
            matrix[i][j] /= temp;
            inverse[i][j] /= temp;
        }

        // Eliminating other rows
        for (int k = 0; k < N; k++) {
            if (k != i) {
                temp = matrix[k][i];
                for (int j = 0; j < N; j++) {
                    matrix[k][j] -= matrix[i][j] * temp;
                    inverse[k][j] -= inverse[i][j] * temp;
                }
            }
        }
    }
}

int main() {
    float mat1[N][N] = {
        {4, 7, 2, 3},
        {3, 6, 2, 1},
        {2, 4, 3, 5},
        {1, 2, 1, 3}
    };

    float inv1[N][N] = {0};

    printf("Original Matrix:\n");
    printMatrix(mat1);

    gaussJordan(mat1, inv1);

    printf("Inverse Matrix:\n");
    printMatrix(inv1);


    float mat2[N][N] = {
        {1, 4, 8, 0}, 
        {0, 0, 9, 0}, 
        {0, -5, 0, 0}, 
        {0, 0, 1, 1}};

    float inv2[N][N] = {0};

    printf("Original Matrix:\n");
    printMatrix(mat2);

    gaussJordan(mat2, inv2);

    printf("Inverse Matrix:\n");
    printMatrix(inv2);

    return 0;
}
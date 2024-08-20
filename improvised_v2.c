#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdlib.h>
#include <limits.h>
#include <math.h>

#define N 4           // Dimension of the square matrix
#define SHIFT_AMOUNT 8 // Define the shift amount for fixed-point scaling
#define SCALE_FACTOR (1 << SHIFT_AMOUNT) 

// Function to print the matrix (fixed-point version)
void printMatrix(int32_t matrix[N][N]) {
    for (register int i = 0; i < N; i++) {
        for (register int j = 0; j < N; j++) {
            printf("%6.3f ", (float)matrix[i][j] / SCALE_FACTOR);
        }
        printf("\n");
    }
    printf("\n");
}

// Function to perform Gauss-Jordan elimination to invert the matrix
void gaussJordan(int32_t matrix[N][N], int32_t inverse[N][N]) {
    int32_t temp, factor, invTemp;

    // Initializing the inverse matrix to the identity matrix (scaled)
    for (register int i = 0; i < N; i++) {
        inverse[i][i] = SCALE_FACTOR;
    }

    // Performing Gauss-Jordan elimination
    for (register int i = 0; i < N; i++) {
        // Find the row with the maximum element in the current column
        register int maxRow = i;
        int32_t maxVal = abs(matrix[i][i]);
        for (register int k = i + 1; k < N; k++) {
            int32_t absVal = abs(matrix[k][i]);
            if (absVal > maxVal) {
                maxVal = absVal;
                maxRow = k;
            }
        }

        // Swap the current row with the row of the maximum element
        if (maxRow != i) {
            for (register int j = 0; j < N; j += 4) {
                // Unrolling the swap operation
                temp = matrix[i][j];
                matrix[i][j] = matrix[maxRow][j];
                matrix[maxRow][j] = temp;

                temp = inverse[i][j];
                inverse[i][j] = inverse[maxRow][j];
                inverse[maxRow][j] = temp;

                temp = matrix[i][j + 1];
                matrix[i][j + 1] = matrix[maxRow][j + 1];
                matrix[maxRow][j + 1] = temp;

                temp = inverse[i][j + 1];
                inverse[i][j + 1] = inverse[maxRow][j + 1];
                inverse[maxRow][j + 1] = temp;

                temp = matrix[i][j + 2];
                matrix[i][j + 2] = matrix[maxRow][j + 2];
                matrix[maxRow][j + 2] = temp;

                temp = inverse[i][j + 2];
                inverse[i][j + 2] = inverse[maxRow][j + 2];
                inverse[maxRow][j + 2] = temp;

                temp = matrix[i][j + 3];
                matrix[i][j + 3] = matrix[maxRow][j + 3];
                matrix[maxRow][j + 3] = temp;

                temp = inverse[i][j + 3];
                inverse[i][j + 3] = inverse[maxRow][j + 3];
                inverse[maxRow][j + 3] = temp;
            }
        }

        // Normalize the pivot row
        temp = matrix[i][i];
        if (temp == 0) {
            printf("Matrix is singular and cannot be inverted.\n");
            exit(1);
        }

        // Scale the row using fixed-point arithmetic
        invTemp = (SCALE_FACTOR << SHIFT_AMOUNT) / temp; // Precompute reciprocal of pivot element
        for (register int j = 0; j < N; j += 4) {
            // Unrolling the normalization operation
            matrix[i][j] = (matrix[i][j] * invTemp) >> SHIFT_AMOUNT;
            inverse[i][j] = (inverse[i][j] * invTemp) >> SHIFT_AMOUNT;

            matrix[i][j + 1] = (matrix[i][j + 1] * invTemp) >> SHIFT_AMOUNT;
            inverse[i][j + 1] = (inverse[i][j + 1] * invTemp) >> SHIFT_AMOUNT;

            matrix[i][j + 2] = (matrix[i][j + 2] * invTemp) >> SHIFT_AMOUNT;
            inverse[i][j + 2] = (inverse[i][j + 2] * invTemp) >> SHIFT_AMOUNT;

            matrix[i][j + 3] = (matrix[i][j + 3] * invTemp) >> SHIFT_AMOUNT;
            inverse[i][j + 3] = (inverse[i][j + 3] * invTemp) >> SHIFT_AMOUNT;
        }

        // Eliminate other rows
        for (register int k = 0; k < N; k++) {
            if (k != i) {
                factor = matrix[k][i];
                for (register int j = 0; j < N; j += 4) {
                    // Unrolling the row elimination operation
                    matrix[k][j] -= (matrix[i][j] * factor) >> SHIFT_AMOUNT;
                    inverse[k][j] -= (inverse[i][j] * factor) >> SHIFT_AMOUNT;

                    matrix[k][j + 1] -= (matrix[i][j + 1] * factor) >> SHIFT_AMOUNT;
                    inverse[k][j + 1] -= (inverse[i][j + 1] * factor) >> SHIFT_AMOUNT;

                    matrix[k][j + 2] -= (matrix[i][j + 2] * factor) >> SHIFT_AMOUNT;
                    inverse[k][j + 2] -= (inverse[i][j + 2] * factor) >> SHIFT_AMOUNT;

                    matrix[k][j + 3] -= (matrix[i][j + 3] * factor) >> SHIFT_AMOUNT;
                    inverse[k][j + 3] -= (inverse[i][j + 3] * factor) >> SHIFT_AMOUNT;
                }
            }
        }
    }
}

int main() {
    // Test matrix 1
    float mat1[N][N] = {
        {4, 7, 2, 3},
        {3, 6, 2, 1},
        {2, 4, 3, 5},
        {1, 2, 1, 3}
    };

    // Test matrix 2
    float mat2[N][N] = {
        {1, 4, 8, 0}, 
        {0, 0, 9, 0}, 
        {0, -5, 0, 0}, 
        {0, 0, 1, 1}
    };

    int32_t fixed_mat1[N][N], fixed_mat2[N][N];
    int32_t inv1[N][N] = {0}, inv2[N][N] = {0};

    // Convert the first matrix to fixed-point
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            fixed_mat1[i][j] = (int32_t)(mat1[i][j] * SCALE_FACTOR);
        }
    }

    // Convert the second matrix to fixed-point
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            fixed_mat2[i][j] = (int32_t)(mat2[i][j] * SCALE_FACTOR);
        }
    }

    printf("Original Matrix 1:\n");
    printMatrix(fixed_mat1);

    gaussJordan(fixed_mat1, inv1);

    printf("Inverse Matrix 1:\n");
    printMatrix(inv1);

    printf("Original Matrix 2:\n");
    printMatrix(fixed_mat2);

    gaussJordan(fixed_mat2, inv2);

    printf("Inverse Matrix 2:\n");
    printMatrix(inv2);

    return 0;
}

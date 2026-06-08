#include "cpu_functions.h"

void copy_array(bench_t *A, bench_t *B, int size) {
    for (int i = 0; i < size; i++) {
        B[i] = A[i];
    }
}

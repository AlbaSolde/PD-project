#ifndef CPU_FUNCTIONS_H
#define CPU_FUNCTIONS_H

#ifdef INT
  typedef int bench_t;
#elif FLOAT
  typedef float bench_t;
#elif DOUBLE
  typedef double bench_t;
#endif

void copy_array(bench_t *A, bench_t *B, int size);

#endif

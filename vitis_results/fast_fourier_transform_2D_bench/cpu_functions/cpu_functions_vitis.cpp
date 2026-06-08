// cpu_functions_vitis.cpp
// FFT2D sintetizable para Vitis HLS
// - cosf/sinf se pueden usar (soportados por Vitis)
// - arrays estáticos en lugar de punteros dobles
// - sin malloc, sin fftw3

#include "cpu_functions.h"
#include <math.h>

#define MAX_N 64

#ifndef M_PI
#define M_PI 3.14159265358979323846
#endif

static void fft1D(COMPLEX* row, int n) {
    // Bit-reversal
    int j = 0;
    for (int i = 1; i < n; i++) {
        int bit = n >> 1;
        for (; j & bit; bit >>= 1)
            j ^= bit;
        j ^= bit;
        if (i < j) {
            bench_t tmp_x = row[i].x; row[i].x = row[j].x; row[j].x = tmp_x;
            bench_t tmp_y = row[i].y; row[i].y = row[j].y; row[j].y = tmp_y;
        }
    }
    // Butterfly
    for (int len = 2; len <= n; len <<= 1) {
        bench_t ang  = (bench_t)(-2.0 * M_PI / len);
        bench_t wcos = cosf(ang);
        bench_t wsin = sinf(ang);
        for (int i = 0; i < n; i += len) {
            bench_t cur_cos = 1.0;
            bench_t cur_sin = 0.0;
            for (int k = 0; k < len / 2; k++) {
                bench_t ux = row[i+k].x;
                bench_t uy = row[i+k].y;
                bench_t vx = row[i+k+len/2].x * cur_cos - row[i+k+len/2].y * cur_sin;
                bench_t vy = row[i+k+len/2].x * cur_sin + row[i+k+len/2].y * cur_cos;
                row[i+k].x           = ux + vx;
                row[i+k].y           = uy + vy;
                row[i+k+len/2].x     = ux - vx;
                row[i+k+len/2].y     = uy - vy;
                bench_t new_cos = cur_cos * wcos - cur_sin * wsin;
                bench_t new_sin = cur_cos * wsin + cur_sin * wcos;
                cur_cos = new_cos;
                cur_sin = new_sin;
            }
        }
    }
}

// Top-level: arrays 1D planos en lugar de COMPLEX**
// c_flat[i*ny + j] equivale a c[i][j]
bool FFT2D_flat(COMPLEX* c_flat, int nx, int ny, COMPLEX* out_flat) {
    // Copiar entrada
    for (int i = 0; i < nx * ny; i++)
        out_flat[i] = c_flat[i];

    // FFT por filas
    for (int i = 0; i < nx; i++)
        fft1D(&out_flat[i * ny], ny);

    // FFT por columnas
    COMPLEX col[MAX_N];
    for (int j = 0; j < ny; j++) {
        for (int i = 0; i < nx; i++)
            col[i] = out_flat[i * ny + j];
        fft1D(col, nx);
        for (int i = 0; i < nx; i++)
            out_flat[i * ny + j] = col[i];
    }
    return true;
}

// ── resto sin cambios ─────────────────────────────────────────

long int get_timestamp(){
    struct timeval time_now{};
    gettimeofday(&time_now, nullptr);
    time_t msecs_time = (time_now.tv_sec * 1000) + (time_now.tv_usec / 1000);
    return (long int) msecs_time;
}

bool compare_vectors(const bench_t* host, const bench_t* device, const int64_t size){
    for (int i = 0; i < size; ++i){
        if (fabs(host[i] - device[i]) > 1e-4){
            printf("Error in element %d is %f but was %f\n", i, device[i], host[i]);
            return false;
        }
    }
    return true;
}

bool compare_vectors(COMPLEX **host, COMPLEX **device, const int64_t size){
    for (unsigned int i = 0; i < size; ++i)
        for (unsigned int j = 0; j < size; ++j){
            if (fabs(host[i][j].x - device[i][j].x) > 1e-4){
                printf("Error in element %d %d is %f but was %f\n", i, j, device[i][j].x, host[i][j].x);
                return false;
            }
            if (fabs(host[i][j].y - device[i][j].y) > 1e-4){
                printf("Error in element %d %d is %f but was %f\n", i, j, device[i][j].y, host[i][j].y);
                return false;
            }
        }
    return true;
}

void print_double_hexadecimal_values(const char* filename, bench_t* float_vector, unsigned int size){
    FILE *output_file = fopen(filename, "w");
    for (unsigned int i = 0; i < size; ++i){
        binary_float.f = float_vector[i];
        fprintf(output_file, "%02x", binary_float.binary_values.a);
        fprintf(output_file, "%02x", binary_float.binary_values.b);
        fprintf(output_file, "%02x", binary_float.binary_values.c);
        fprintf(output_file, "%02x", binary_float.binary_values.d);
        fprintf(output_file, "%02x", binary_float.binary_values.e);
        fprintf(output_file, "%02x", binary_float.binary_values.f);
        fprintf(output_file, "%02x", binary_float.binary_values.g);
        fprintf(output_file, "%02x", binary_float.binary_values.h);
        fprintf(output_file, "\n");
    }
    fclose(output_file);
}

void get_double_hexadecimal_values(const char* filename, bench_t* float_vector, unsigned int size){
    FILE *file = fopen(filename, "r");
    char *line = NULL;
    size_t len = 0;
    for (unsigned int i = 0; i < size; ++i){
        getline(&line, &len, file);
        line[strlen(line)-1] = 0;
        char *temp = (char*) malloc(sizeof(char) * 2);
        char *ptr;
        temp[0]=line[0];  temp[1]=line[1];  binary_float.binary_values.a=(char)strtol(temp,&ptr,16);
        temp[0]=line[2];  temp[1]=line[3];  binary_float.binary_values.b=(char)strtol(temp,&ptr,16);
        temp[0]=line[4];  temp[1]=line[5];  binary_float.binary_values.c=(char)strtol(temp,&ptr,16);
        temp[0]=line[6];  temp[1]=line[7];  binary_float.binary_values.d=(char)strtol(temp,&ptr,16);
        temp[0]=line[8];  temp[1]=line[9];  binary_float.binary_values.e=(char)strtol(temp,&ptr,16);
        temp[0]=line[10]; temp[1]=line[11]; binary_float.binary_values.f=(char)strtol(temp,&ptr,16);
        temp[0]=line[12]; temp[1]=line[13]; binary_float.binary_values.g=(char)strtol(temp,&ptr,16);
        temp[0]=line[14]; temp[1]=line[15]; binary_float.binary_values.h=(char)strtol(temp,&ptr,16);
        float_vector[i] = binary_float.f;
    }
    fclose(file);
}

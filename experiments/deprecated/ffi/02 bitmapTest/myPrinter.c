#include <stdint.h>
#include <stdio.h>

int printBtitmap(char* data)
{
    FILE *f;
    f = fopen("/home/jakob/Studium/bp/BP2017RH1/experiments/ffi/02 bitmapTest/log", "a");
    fprintf(f, "hallo at0: %i\n", data[0]);
    fclose(f);
    data[0] = 11;
    return 4;
} 

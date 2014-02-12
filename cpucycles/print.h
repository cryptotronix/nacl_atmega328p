#ifndef PRINT_H
#define PRINT_H

void serial_init(void);

void serial_write(unsigned char c);

void print(const char *s);

void bigint_print(const unsigned char *x, unsigned char xlen);

void printllu(unsigned long long x);

#endif

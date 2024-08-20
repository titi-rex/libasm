#include "test.h"

void    check(bool e)
{
    if (e)
        printf(GREEN"[OK] "END);
    else
        printf(RED"[KO] "END);
}

void    fatal(const char * str)
{
    printf("FATAL: %s\n", str);
    exit(1);
}

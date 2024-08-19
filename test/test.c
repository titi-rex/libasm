# include <stdio.h>
# include <string.h>
# include "libasm.h"


int main(void)
{
    char str[7] = "hello!";

    printf("test %i: str: %10s, expected: %lu, got %lu\n", 0, str, strlen(str), ft_strlen(str));

}

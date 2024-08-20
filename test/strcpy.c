#include "test.h"

void _strcpy_wrapper(const char * string)
{
    size_t  len = strlen(string);
    char *  dst1 = malloc(sizeof(char) * len);
    char *  dst2 = malloc(sizeof(char) * len);

    if (dst1 == NULL || dst2 == NULL)
       fatal("malloc failed");
    check(ft_strcpy(dst1, string) == strcpy(dst2, string));
    check(strcmp(dst1, dst2));
    free(dst1);
    free(dst2);
}

void    strcpy_tester(void)
{
    printf("strcpy: ");
    _strcpy_wrapper("hehe");
    _strcpy_wrapper("hehslkfj sljfojes;ofh sf6s84efs4efsf jse9w73 os;l9es9rf9fru3u8sl38ursl83rus9w3l8ry sl3yr7sylwsi3rysiyr 3i7yslry3iyurslie");
    _strcpy_wrapper("");
    printf("\n");
}



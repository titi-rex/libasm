#include "test.h"

void _strdup_wrapper(const char * string)
{
    char *  dst1 = ft_strdup(string);
    char *  dst2 = strdup(string);

    check(dst1 == dst2);
    if (dst1 != NULL && dst1 != NULL)
        check(strcmp(dst1, dst2));
    else
        check(1 == 2);

    if (dst1)
        free(dst1);
    if (dst2)
        free(dst2);
}

void    strdup_tester(void)
{
    printf("strdup: ");
    _strdup_wrapper("hehe");
    _strdup_wrapper("hehslkfj sljfojes;ofh sf6s84efs4efsf jse9w73 os;l9es9rf9fru3u8sl38ursl83rus9w3l8ry sl3yr7sylwsi3rysiyr 3i7yslry3iyurslie");
    _strdup_wrapper("");
    printf("\n");
}

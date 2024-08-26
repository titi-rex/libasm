#include "test.h"

void _strcmp_wrapper(const char * a, const char * b)
{
    check(ft_strcmp(a, b) == strcmp(a, b));
}

void    strcmp_tester(void)
{
    printf("strcmp: ");
    _strcmp_wrapper("hehe", "455heheeeeee");
    _strcmp_wrapper("sasd", "");
    _strcmp_wrapper("z", "");
    _strcmp_wrapper("hehe", "hehe");
    _strcmp_wrapper("hehslkfj sljfojes;ofh sf6s84efs4efsf jse9w73 os;l9es9rf9fru3u8sl38ursl83rus9w3l8ry sl3yr7sylwsi3rysiyr 3i7yslry3iyurslie", "hehslkfj sljfojes;ofh sf6s84efs4efsf jse9w73 os;l9es9rf9fru3u8sl38ursl83rus9w3l8ry sl3yr7sylwsi3rysiyr 3i7yslry3iyurslie");
    _strcmp_wrapper("", "");
    _strcmp_wrapper("", "z");
    _strcmp_wrapper("", "daww");
    _strcmp_wrapper("a", "adaww");
    _strcmp_wrapper("0", "z");
    _strcmp_wrapper("hehe", "heheeeeee");
    _strcmp_wrapper("hehslkfj sljfojes;ofh sf6s84efs4efsf jse9w73 os;l9es9rf9fru3u8sl38ursl83rus874a8wysiyr 3i7yslry3iyurslie", "hehslkfj sljfojes;ofh sf6s84efs4efsf jse9w73 os;l9es9rf9fru3u8sl38ursl83rus9w3l8ry sl3yr7sylwsi3rysiyr 3i7yslry3iyurslie");
    _strcmp_wrapper("hehe", "hehslkfj sljfojes;ofh sf6s84efs4efsf jse9w73 os;l9es9rf9fru3u8sl38ursl83rus9w3l8ry sl3yr7sylwsi3rysiyr 3i7yslry3iyurslie");
    printf("\n");
}


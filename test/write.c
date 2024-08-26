#include "test.h"


void _write_wrapper(int fds[2], const char * string)
{
    size_t  len = strlen(string);
    char    exp[len + 1];
    char    got[len + 1];
    int     errno_exp = 0;
    int     errno_got = 0;

    exp[len] = 0;
    got[len] = 0;
    
    ssize_t l_exp = write(fds[1], string, len);
    if (l_exp == -1)
    {
        errno_exp = errno;
        errno = 0;
    }
    else
        read(fds[0], exp, len);

    ssize_t l_got = ft_write(fds[1], string, len);
    if (l_got == -1)
        errno_got = errno;
    else
        read(fds[0], got, len);

    check(l_exp == l_got);
    if ((l_exp == -1) || (l_got == -1))
        check(errno_exp == errno_got);
    else
        check(strcmp(exp, got) == 0);    

}

void    write_tester(void)
{
    printf("write: ");
    int     fds[2];
    int     badfds[2];
    pipe(fds);

    badfds[0] = -1;
    badfds[1] = -1;

    _write_wrapper(fds, "hehe\n");
    _write_wrapper(fds, "comparativement 59 'he'\n");
    _write_wrapper(fds, "comparativement 59 'he'\ndawdkhuawdlahwld akwhdklawhd klawhdiluhawliukh laiuwhdila uhwd;iuahwd;o hawd ;a;owuid;auhwdiuwah iawhd");
    _write_wrapper(fds, "");
    _write_wrapper(badfds, "nop");
    printf("\n");
    close(fds[0]);
    close(fds[1]);
}

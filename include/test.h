#ifndef TEST_H
# define TEST_H

# include <stdio.h>
# include <string.h>
# include <assert.h>
# include <signal.h>
# include <stdlib.h>
# include <unistd.h>
# include <fcntl.h>
# include <errno.h>
# include <stdbool.h>
# include "libasm.h"
# include "colors.h"

void    check(bool e);
void    fatal(const char * str);
void    sigsegv_handler(int sig);


void    strlen_tester(void);
void    strcpy_tester(void);
void    strcmp_tester(void);
void    strdup_tester(void);
void    write_tester(void);
void    read_tester(void);

# define I_START    0
# define I_STRLEN   1
# define I_STRCPY   2
# define I_STRCMP   3
# define I_STRDUP   4
# define I_WRITE    5
# define I_READ     5



#endif

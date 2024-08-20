#ifndef TEST_H
# define TEST_H

#include <stdio.h>
#include <string.h>
#include <assert.h>
#include <signal.h>
#include <stdlib.h>
#include <stdbool.h>
#include "libasm.h"
#include "colors.h"

void    check(bool e);
void    fatal(const char * str);

void    strlen_tester(void);
void    strcpy_tester(void);
void    strcmp_tester(void);
void    strdup_tester(void);



#endif

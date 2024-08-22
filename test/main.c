#include "test.h"

sig_atomic_t    g_test = I_START;

int main(void)
{
    signal(SIGSEGV, sigsegv_handler);
    strlen_tester();
    strcpy_tester();
    strcmp_tester();
    strdup_tester();
}




/*

errno check
malloc check
sigsev signal handler -> exit


*/
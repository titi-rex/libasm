#include "test.h"

int _cmp_int(void* a, void* b)
{
    return ((uint64_t)a > (uint64_t)b);
}

int _cmp_str(void* a, void* b)
{
    return (strcmp(a, b) > 0);
}

/*
Create the function ft_list_sort which sorts the list’s elements by ascending order
by comparing two elements by comparing their data with a function
Function pointed by cmp will be used as follows :    (*cmp)(list_ptr->data, list_other_ptr->data);
cmp could be for instance ft_strcmp.
*/
void    list_sort(t_list **begin_list, int (*cmp)())
{
    if (!begin_list || !*begin_list || !cmp)
        return ;

    t_list* current = *begin_list;
    while (current->next)
    {
        if ((*cmp)(current->data, current->next->data))
        {
            void*   tmp = current->data;
            t_list* next = current->next;
            current->data = next->data;
            next->data = tmp;
            list_sort(begin_list, cmp);
        }
        current = current->next;
    }
}

void    list_print(t_list* list)
{
    while (list)
    {
        printf("%lu ", (uint64_t)list->data);
        list = list->next;
    }
    printf("\n");
}

/**
 * @brief check if list is sorted using cmp
 * 
 * @param head 
 * @param cmp function to use for test
 * @return int 
 */
int list_sorted(t_list* head, int (*cmp)())
{
    while(head && head->next)
    {
        if ((*cmp)(head->data, head->next->data))
            return (1);
        head = head->next;
    }
    return (0);
}


void    list_sort_tester(void)
{
    printf("list_sort: ");
    t_list  *lst = NULL;

    uint64_t    len = 3;
    for(uint64_t i = 0; i < len; i++)
    {
        uint64_t r =  i;
        list_push_front(&lst, (void*)r);
    }
    list_sort(&lst, _cmp_int);
    check(list_sorted(lst, _cmp_int) == 0);
    printf("\n");
    return ;
    listclear(&lst);
    lst = NULL;

    char*   s1 = "ssello";
    char*   s2 = "aaaa";
    char*   s3 = "hello";
    list_push_front(&lst, s3);
    list_push_front(&lst, s2);
    list_push_front(&lst, s1);
    ft_list_sort(&lst, _cmp_str);
    check(list_sorted(lst, _cmp_str) == 0);
    listclear(&lst);

    printf("\n");
}
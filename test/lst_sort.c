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
void    ft_list_sort(t_list **begin_list, int (*cmp)())
{
    if (!begin_list || !*begin_list || !cmp)
        return ;

    t_list* current = *begin_list;
    while (current->next)
    {
        if ((*cmp)(current->data, current->next->data))
        {
            void*   tmp = current->data;
            current->data = current->next->data;
            current->next->data = tmp;
            ft_list_sort(begin_list, cmp);
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

    uint64_t    len = 500;
    for(uint64_t i = 0; i < len; i++)
    {
        uint64_t r =  i;
        list_push_front(&lst, (void*)r);
    }
    ft_list_sort(&lst, _cmp_int);
    check(list_sorted(lst, _cmp_int) == 0);

    listclear(&lst);
    printf("\n");
}
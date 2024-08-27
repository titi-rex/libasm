#include "test.h"


void    list_push_front_wrapper(t_list** list, void* data, t_list* exp_next)
{
    ft_list_push_front(list, data);
    check(*list != NULL);
    if (*list == NULL)
        return ;
    printf("ms.");
    check(malloc_usable_size(*list) == sizeof(t_list));
    check((*list)->data == data);
    check((*list)->next == exp_next);
}

void    list_push_front_tester(void)
{
    printf("list_push_front: ");
    t_list* list = NULL;

    char*   str = "dd";
    list_push_front_wrapper(&list, (void*)str, NULL);
    t_list* save = list;

    int     i = 48;
    list_push_front_wrapper(&list, (void*)&i, list);

    int     tab[37];
    list_push_front_wrapper(&list, (void*)tab, list);

    printf("spe:");
    if (list != NULL && list->next != NULL && list->next->next != NULL)
    {
        check(list->next->next == save);
        check(list->next->next->data == (void*)str);
        check(list->next->next->next == NULL);
    }
    else
        check(1 == 2);


    listclear(&list);
    printf("\n");
}

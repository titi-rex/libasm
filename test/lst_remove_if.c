#include "test.h"

/*
Create the function ft_list_remove_if which removes from the list, all elements
whose data compared to data_ref using cmp, makes cmp return 0.
• The data from an element to be erased should be freed using free_fc
Function pointed by cmp and by free_fct will be used as follows :
    (*cmp)(list_ptr->data, data_ref);
    (*free_fct)(list_ptr->data);
*/
void    ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *))
{
    (void)free_fct;
    (void)begin_list;
    (void)data_ref;
    (void)cmp;

}

void    lst_remove_if_wrapper(void)
{

}

void    lst_remove_if_tester(void)
{

}
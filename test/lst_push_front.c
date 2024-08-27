#include "test.h"

/*
Create the function ft_create_elem which creates a new element of t_list type.
• It should assign data to the given argument and next to NULL.
can use malloc
*/
t_list *create_elem(void *data)
{
    (void)data;
    /*

    t_list	*ft_lstnew(void *content)
    {
        t_list	*new;

        new = (t_list *)malloc(sizeof(t_list));
        if (!new)
            return (NULL);
        new->content = content;
        new->next = NULL;
        return (new);
    }
*/
    return (NULL);
}


/*
Create the function ft_create_elem which creates a new element of t_list type.
• It should assign data to the given argument and next to NULL.
• Here’s how it should be prototyped :
t_list *ft_create_elem(void *data);
can use ft_createelement
*/
void	lst_push_front(t_list **begin_list, void *data)
{
    (void)data;
    (void)begin_list;
	// if (*begin_list)
	// 	data->next = *begin_list;
	// *begin_list = data;
}


void    lst_push_front_wrapper(void)
{

}

void    lst_push_front_tester(void)
{

}

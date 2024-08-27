#include "test.h"


/*
Create the function ft_list_size which returns the number of elements in the
list.
*/
int	ft_list_size(t_list *begin_list)
{
	int	size;

	size = 0;
	while (begin_list)
	{
		size++;
		begin_list = begin_list->next;
	}
	return (size);
}


void    list_size_wrapper(void)
{

}

void    list_size_tester(void)
{

}
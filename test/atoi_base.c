#include "test.h"

/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_atoi_base.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tlegrand <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/07/14 17:31:10 by tlegrand          #+#    #+#             */
/*   Updated: 2022/07/28 09:15:09 by tlegrand         ###   ########lyon.fr   */
/*                                                                            */
/* ************************************************************************** */

int	_check_base(char *base)
{
	int		len;
	int		i;

	len = 0;
	while (base[len])
	{
		i = len + 1;
		if (base[len] == 45 || base[len] == 43 || base[len] <= 32)
			return (1);
		while (base[i] != base[len] && base[i])
			i++;
		if (base[i] != 0)
			return (1);
		len++;
	}
	return (len);
}

int	_extract_nbr(char *str, char *base, int len)
{
	int		res;
	int		i;

	res = 0;
	i = 0;
	while (*str != base[i] && base[i])
		i++;
	while (*str == base[i] && base[i])
	{
		res = res * len + i;
		str++;
		i = 0;
		while (*str != base[i] && base[i])
			i++;
	}
	return (res);
}

int	ft_atoi_base(char *str, char *base)
{
	int		len_base;
	int		signe;
	int		nb;

	signe = 1;
	nb = 0;
	len_base = _check_base(base);
	if (len_base <= 1)
		return (0);
	while (*str == 32 || (*str >= 9 && *str <= 13))
		str++;
	while (*str == 45 || *str == 43)
	{
		if (*str == 45)
			signe *= -1;
		str++;
	}
	nb = _extract_nbr(str, base, len_base);
	return (nb * signe);
}

void	check_ft_atoi_base(void)
{
	char	str1[] = "0000";
	char	str2[] = "+-+--2f-1234d2kldjj";	
	char	str3[] = " +-+----nope2kldj9f";
	char	base1[] = "10";
	char	base2[] = "0123456789abcdef";
	char	base3[] = "poneyvif";

	printf("\n\n#____!n4xt_n4xt_n4xt!____#\n");
	printf("\n\tcheck_ft_atoi_base\n\n");
	printf("str:\t%s\tbase:\t%s\nresult:\t%d\n", str1, base1, ft_atoi_base(str1, base1));
	printf("str:\t%s\tbase:\t%s\nresult:\t%d\n", str2, base2, ft_atoi_base(str2, base2));
	printf("str:\t%s\tbase:\t%s\nresult:\t%d\n", str3, base3, ft_atoi_base(str3, base3));

}

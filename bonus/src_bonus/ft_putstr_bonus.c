#include "minitalk_bonus.h"

void	ft_putstr(char *s)
{
	int	i;

	i = 0;
	if (s != NULL)
	{
		while (s[i])
		{
			ft_putchar(s[i]);
			i++;
		}
	}
}

#include "../include/minitalk.h"

void send_sig(int pid, char *msg)
{
	int i;
	int bit;

	i = 0;
	bit = 0;
	while (msg[i])
	{
		bit = 0;
		while (bit < 8)
		{
			if (msg[i] & (0x80 >> bit))
				kill(pid, SIGUSR2);
			else
				kill(pid, SIGUSR1);
			usleep(500);
			bit++;
		}
		i++;
	}
}

int main(int ac, char **av)
{
	int s_pid;
	
	if (ac != 3)
		return (0);
	s_pid = ft_atoi(av[1]);
	if (s_pid <= 0)
	{
		ft_putstr("bad pid");
		return (0);
	}
	send_sig(s_pid, av[2]);
	return (0);
}
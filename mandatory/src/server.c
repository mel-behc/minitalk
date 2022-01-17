#include "../include/minitalk.h"

void sig_handler(int sg, siginfo_t *info, void *n)
{
	static unsigned char	c;
	static int	client_pid;
	static int	bit;

	(void)n;
	if (!client_pid)
		client_pid = info->si_pid;
	if (client_pid != info->si_pid)
	{
		client_pid = info->si_pid;
		c = 0;
		bit = 0;
	}
	if (sg == SIGUSR2)
		c |= 0x80 >> bit;
	bit++;
	if (bit == 8)
	{
		ft_putchar(c);
		bit = 0;
		c = 0;
	}
}

int	main()
{
	int	pid;
	struct	sigaction server;

	pid = getpid();
	ft_putnbr(pid);
	ft_putchar('\n');
	server.sa_flags = SA_SIGINFO;
	server.sa_sigaction = sig_handler;
	sigaction(SIGUSR1, &server, NULL);
	sigaction(SIGUSR2, &server, NULL);
	while (1)
		pause();
}
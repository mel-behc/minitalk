SERVER = server
CLIENT = client
SERVER_B = server_bonus
CLIENT_B = client_bonus
CC = gcc
CFLAGS = -Wall -Werror -Wextra
HEADER = ./mandatory/include
HEADER_B = ./bonus/include_bonus
SRC = ./mandatory/src/ft_putchar.c ./mandatory/src/ft_putstr.c ./mandatory/src/ft_putnbr.c ./mandatory/src/ft_atoi.c
SRC_B = ./bonus/src_bonus/ft_putchar_bonus.c ./bonus/src_bonus/ft_putstr_bonus.c ./bonus/src_bonus/ft_putnbr_bonus.c ./bonus/src_bonus/ft_atoi_bonus.c

SERVER_OBJ = ./mandatory/src/server.o
SERVER_SRC = ./mandatory/src/server.c

CLIENT_OBJ = ./mandatory/src/client.o
CLIENT_SRC = ./mandatory/src/client.c

SERVER_OBJ_B = ./bonus/src_bonus/server_bonus.o
SERVER_SRC_B = ./bonus/src_bonus/server_bonus.c

CLIENT_OBJ_B = ./bonus/src_bonus/client_bonus.o
CLIENT_SRC_B = ./bonus/src_bonus/client_bonus.c


OBJ = $(SRC:.c=.o)
OBJ_B = $(SRC_B:.c=.o)

all :$(OBJ) $(SERVER) $(CLIENT)

$(SERVER): $(OBJ) $(SERVER_OBJ)
	$(CC) $(CFLAGS) $(OBJ) $(SERVER_OBJ) -o $@ -I $(HEADER)

$(CLIENT): $(OBJ) $(CLIENT_OBJ)
	$(CC) $(CFLAGS) $(OBJ) $(CLIENT_OBJ) -o $@ -I $(HEADER)


bonus :$(OBJ_B) $(SERVER_B) $(CLIENT_B)

$(SERVER_B): $(OBJ_B) $(SERVER_OBJ_B)
	$(CC) $(CFLAGS) $(OBJ_B) $(SERVER_OBJ_B) -o $@ -I $(HEADER_B)

$(CLIENT_B): $(OBJ_B) $(CLIENT_OBJ_B)
	$(CC) $(CFLAGS) $(OBJ_B) $(CLIENT_OBJ_B) -o $@ -I $(HEADER_B)

%_bonus.o: %_bonus.c $(HEADER_B)
	$(CC) $(CFLAGS) -c $< -o $@ -I $(HEADER_B)

%.o: %.c $(HEADER)
	$(CC) $(CFLAGS) -c $< -o $@ -I $(HEADER)

clean: 
	rm -rf $(OBJ) $(CLIENT_OBJ) $(SERVER_OBJ)
	rm -rf $(OBJ_B) $(CLIENT_OBJ_B) $(SERVER_OBJ_B)
fclean: clean
	rm -rf $(NAME)

re: fclean all


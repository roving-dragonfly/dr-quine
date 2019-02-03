NAME = Colleen
CC = gcc
CFLAGS = -Wall -Wextra -Werror
SRCS = Colleen.c
OBJS = $(SRCS:.c=.o)
RM = rm -f

.c.o:
	$(CC) $(FLAGS) $(INCLUDES) -o $@ -c $<

all: $(NAME)

$(NAME): $(OBJS)
	$(CC) $(INCLUDES) -o $(NAME) $^

clean:
	$(RM) $(OBJS)

fclean: clean
	$(RM) $(NAME)

re: fclean all

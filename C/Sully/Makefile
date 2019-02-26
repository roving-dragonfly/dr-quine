NAME = Sully
CC = gcc
CFLAGS = -Wall -Wextra -Werror
SRCS = Sully.c
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
	$(RM) $(NAME) $(NAME)_*

re: fclean all

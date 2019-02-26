NAME = Colleen
ASM = nasm
ASM_FLAGS = -f macho64

LINKER = ld
LINKER_FLAGS = -macosx_version_min 10.8 -lSystem

CC = gcc
CFLAGS = -Wall -Wextra -Werror

SRCS = Colleen.s
OBJS = $(SRCS:.s=.o)
RM = rm -f

.s.o:
	$(ASM) $(ASM_FLAGS) $<

all: $(NAME)

$(NAME): $(OBJS)
	$(LINKER) $(LINKER_FLAGS) -o $(NAME) $^

clean:
	$(RM) $(OBJS)

fclean: clean
	$(RM) $(NAME)

re: fclean all

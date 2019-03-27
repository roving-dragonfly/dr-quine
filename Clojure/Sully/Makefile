NAME= Sully
CLJ= clojure
SRC= Sully.clj
RM= rm -rf

all: $(NAME)

$(NAME): $(SRC)
	$(CLJ) $(SRC)

clean:
	$(RM) .cpcache

fclean: clean
	$(RM) Sully_*

re: fclean all

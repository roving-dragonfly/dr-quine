NAME= Grace
CLJ= clojure
SRC= Grace.clj
RM= rm -rf

all: $(NAME)

$(NAME): $(SRC)
	$(CLJ) $(SRC)

clean:
	$(RM) .cpcache

fclean: clean
	$(RM) Grace_kid.clj

re: fclean all

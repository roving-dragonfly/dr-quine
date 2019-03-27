NAME= Colleen
CLJ= clojure
SRC= Colleen.clj
RM= rm -rf

all: $(NAME)

$(NAME): $(SRC)
	$(CLJ) -m $(NAME)

clean:
	$(RM) .cpcache

fclean: clean
	@echo "No files to fclean"

re: fclean all

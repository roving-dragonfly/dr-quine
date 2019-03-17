all: rec_make

rec_make:
	make -C ./Colleen
	make -C ./Grace
	make -C ./Sully

clean:
	make -C ./Colleen clean
	make -C ./Grace clean
	make -C ./Sully clean

fclean: clean
	make -C ./Colleen fclean
	make -C ./Grace fclean
	make -C ./Sully fclean

re: fclean all

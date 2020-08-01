guessinggame: guessinggame.sh README.md
	@echo "guessinggame.sh" >> README.md
	@echo "Date" >> README.md
	@date >> README.md
	@echo "Line Count" >> README.md
	@wc -l guessinggame.sh >> README.md

clean:
	rm README.md

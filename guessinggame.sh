function isValid {

	if [[ "$passedGuess" =~ ^[0-9]?[0-9]$ ]]
	then
		validGuess=$passedGuess
	elif [[ -z "$passedGuess" ]]
	then
		echo "Sorry, your input is empty."
		guess=false
	elif [[ "$passedGuess" =~ [a-zA-Z] ]]
	then
		echo "Sorry, integers only."
		guess=false
	fi

}

make guessinggame
while finalAnswer=1
do
	dirs=$(ls -1 | wc -l)
	echo "Guess how many files are in the current directory:"
	read guess
	passedGuess=$guess
	isValid $passedGuess

	if [[ $guess =~ $validGuess ]]
	then
		if [[ $validGuess -eq $dirs ]]
		then
			let finalAnswer=0
			echo "Correct!"
			exit
		elif [[ $validGuess -gt $dirs ]]
		then
			let finalAnswer=1
			echo "Too high."
		elif [[ $validGuess -lt $dirs ]]
		then
			let finalAnswer=1
			echo "Too low."
		fi
	fi
done

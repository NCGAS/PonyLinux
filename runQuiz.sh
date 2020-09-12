### For developers
### When running ponygo, make sure your text has this format: "Text and stuff, newlines are slash n. \n If you have an apostrophe, you'll have to quote it'
### One more time: dollar sign, single quote, text, end single quote. If you need a ' inside, it has to be ' .
### This ensures that the shell interprets your newlines correctly when passed to ponysay.
### If you need to test your string, use echo (no -e)
export tutfile=$1

if [ ! -r "$tutfile" ]; then
    echo "Can't read $tutfile"
    exit 1
fi
score=0
function runTut(){
    numQs=0
    #totalQs=$(grep -e "\S+" $tutfile | wc -l)
    totalQs=$(grep -c -v '^ *$' $tutfile)
    while IFS=$'\t' read -r -a myarray
    do	
	numargs="${#myarray[@]}"
	#echo "numargs is $numargs"
        if [ $numargs -lt 1 ]; then
	    continue
	elif [ $numargs -lt 3 ]; then
            echo "need at least three arguments to make a quiz."
		fi
	let "numQs++"
        question="${myarray[0]}"
        echo "Question ${numQs}/${totalQs}: $question"
        index_of_correct_answer=${myarray[1]}
       question_number=0
        letters=({a..z})
        for ((i=2; i<$numargs; i+=2)); do
            printf "\t%s.) %s\n" "${letters[$question_number]}" "${myarray[$i]}"
            let "question_number++"
        done
        read -p "Type one letter and hit return:  " answer </dev/tty
	tries=1
	## This loop only checks for VALID input, not whether its a correct answer
	while [[ $tries < 3 ]]; do
	    # Turn the letter a,b,c etc into their ascii representation 97,98,99 etc
	    #echo "looping $tries"
            numeric_representation=$(printf "%d" "'$answer")
	    # Check to make sure we only got one character
	    if [[ ${#answer} -gt 1 ]]; then
                echo "You gave me more than one letter! Make a single selection. Attempt $tries out of 3: "
            # Check answer is a-z. Todo: allow A-Z, or 1-whatever.
            elif [[ $numeric_representation -gt 96 && $numeric_representation -lt 123 ]]; then
                break
            else
                    echo "Please type a lowercase letter to indicate your answer. Attempt $tries of 3:"
            fi
	    let "tries++"
	    read -p "Type one letter and hit return:  " answer </dev/tty
	done
        if [[ $tries -gt 2 ]]; then
            echo "You haven't given any input I can use. Skipping this question."        
        else
            index_answer=$(( numeric_representation - 97 ))
            index_response=$(( ( 2 * index_answer ) + 3 ))
	    #echo "answer is $index_answer and respons is $index_response"
            if [[ $index_answer -eq $index_of_correct_answer ]]; then
		echo "Correct!"
		let "score++"
            else
		echo "Sorry, that's incorrect."
            fi
            printf "%s\n" "${myarray[$index_response]}"
	fi
    done < $tutfile
    
    echo "You scored $score point(s) out of $numQs"
    # Grab the current score as saved in the config file
    storedscore=$( perl -lne 'print $1 if /score: (\d+)/' ~/.ponylinux/config)
    if [ -z $storedscore ]; then
	echo "score: $score" >> ~/.ponylinux/config
	#echo "no score yet; setting."
    else
	#echo "Found stored $storedscore"
	totalscore=$(( $storedscore + $score ))
	#echo "Your total score is currently $totalscore"
	perlresult=$(perl -p -ibkp -e "s/score: .+/score: $totalscore/" ~/.ponylinux/config)
    fi
    read -p "Press enter to continue"

}

# This is added in case the script is invoked instead of sourced
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    me="$( cd "$(dirname "$0")" ; pwd -P )"
    source ${UNIXTUT:-$me}/Utilities.sh
    if [[ -z $PONYUSER ]]; then
        checkProgress
    fi
    runTut
fi
### For developers
### When running ponygo, make sure your text has this format: "Text and stuff, newlines are slash n. \n If you have an apostrophe, you'll have to quote it'
### One more time: dollar sign, single quote, text, end single quote. If you need a ' inside, it has to be ' .
### This ensures that the shell interprets your newlines correctly when passed to ponysay.
### If you need to test your string, use echo (no -e)
export tutfile=$1
export esc=$'\033'
export file_index=1
# Gotta use < with wc if we want maths to work: https://stackoverflow.com/questions/10238363/how-to-get-wc-l-to-print-just-the-number-of-lines-without-file-name
export total_lines=$(wc -l < "$tutfile")
#echo "totl lines is $total_lines"
#echo "tutfile is $tutfile"

if [ ! -r "$tutfile" ]; then
    echo "Can't read $tutfile"
    exit 1
fi

function readandDo(){
    #echo "index is $file_index"
    if (( $file_index < 1 )); then
	file_index=1
    elif (( $file_index > $total_lines )); then
	exit 0
    else
	clear	
	# A little flailing. This helped: https://stackoverflow.com/questions/4668640/how-to-execute-command-stored-in-a-variable
	#sed -n ${file_index}p fileDialog.txt | xargs -0 bash # no such file or dir
	#$( sed -n ${file_index}p fileDialog.txt ) # Messes up quotes
	#Get that line https://stackoverflow.com/questions/19327556/get-specific-line-from-text-file-using-just-shell-script/19327690
	cmd="$(sed -n ${file_index}p ${tutfile})"
	eval $cmd # If you do just $cmd, the quotes mess up in the result
    fi
}

function runTut(){
    readandDo
    while (( 1 == 1 )); do
	printf "Press the left and right arrow keys to go back/forward. Up and down keys take you to the beginning and the end. Type q to quit.\n" | fold -s
	read -rsn1 mode # get 1 character
	if [[ $mode == $esc ]]; then
	    read -rsn2 mode # read 2 more chars
	fi
	case $mode in
	    'q') echo QUITTING ; exit ;;
	    '[A') printf "↑"; file_index=1 ;;
	    '[B') printf "↓"; file_index=$total_lines ;;
	    '[D') printf "←"; let file_index-- ;;
	    *) printf "→\n"; let file_index++ ;;
	esac
	readandDo
    done    
}

function getFeedback(){
    echo "getting feedback"
    #https://serverfault.com/questions/377943/how-do-i-read-multiple-lines-from-stdin-into-a-variable
    #read -d '' feedback <<done    
    #{ echo "Subject: testing"; echo "$feedback" } | /usr/sbin/sendmail -v cganote@gmail.com
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
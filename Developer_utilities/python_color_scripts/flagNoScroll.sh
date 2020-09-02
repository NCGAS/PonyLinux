#!/usr/bin/env bash
trap catch INT
function catch(){
    tput cnorm
    exit 0
}
flagRA=('▁' '▁' '▁' '▂' '▂' '▃' '▄' '▅' '▆' '▇' '█' '█' '█' '▇' '▇' '▆' '▅' '▄' '▃' '▃' '▂' '▂' '▁')

flaglen=19
flagchars=${#flagRA[@]}
colors=(16 16 214 214 231 231 231 231 231 231 231 231 231 231 231 214 214 16)
line02=(16 16 214 214 231 231 231 231 16 16 16 231 231 231 231 214 214 16)
line03=(16 16 214 214 231 231 231 16 231 16 231 16 231 231 231 214 214 16)
line04=(16 16 214 214 231 231 231 16 16 214 16 16 231 231 231 214 214 16)
line05=(16 16 214 214 231 231 231 214 16 231 16 214 231 231 231 214 214 16)
line06=(16 16 214 214 231 231 231 231 231 231 231 231 231 231 231 214 214 16)
indexes=(colors line02 line03 line04 line05 line06 colors)
numrows=${#indexes[@]}
let "numrows--"
UPLINE=$(tput cuu1)
ERASELINE=$(tput el)

#colors=(16 17 18 19 20 21 57 56 55 54 53 52 88 89 90 91 92 93 129 128 127 126 125 124 160 161 162 163 164 165 201 200 199 198 197 196 202 208 214 220 226 )
numcolors=${#colors[@]}
echo "chars: $flagchars"
charoffset=0
coloroffset=0
tput civis
## Time loop
while true; do
    if (( $charoffset >= $flagchars )); then
	charoffset=0
    fi
    if (( $coloroffset >= $numcolors )); then
	coloroffset=0
    fi
    ## Row loop
    for lineNumber in $(seq 0 $numrows); do
	charindex=$charoffset	
	colorindex=$coloroffset
	lineref="${indexes[$lineNumber]}"
	lastline="${indexes[$lineNumber - 1]}"
	declare -n whichline="$lineref"
	declare -n lastlineRA="$lastline"
        ## Column loop
	i=0
	#for i in $(seq 0 $flaglen); do
	while (( $i < $flaglen )); do
	    if (( $lineNumber == 0 ));then
		# test without setting 0m each time?
		printf "\033[38;5;%sm%s" ${colors[$colorindex]} ${flagRA[$charindex]}
	    elif (( $lineNumber == $numrows ));then
		printf "\033[38;5;%sm\033[7m%s" ${colors[$colorindex]} ${flagRA[$charindex]}
	    else
		printf "\033[48;5;%sm\033[38;5;%sm%s" ${lastlineRA[$colorindex]} ${whichline[$colorindex]} ${flagRA[$charindex]}
	    fi
	    let "i++"
	    let "colorindex--"
	    let "charindex--"
	    if (( $charindex < 0  )); then
		charindex=$flagchars-1
	    fi
	    if (( $colorindex < 0 )); then
		colorindex=$numcolors-1
	    fi
	done
	printf "\033[0m\n   \033[38;5;94m█"
    done
    let "charoffset++"
    #let "coloroffset++"
    sleep 0.2

    for lineNumber in $(seq 0 $numrows); do
	printf "$UPLINE$ERASELINE"
    done
    printf "\r   \033[38;5;94m█"
done #&
#main=$!
#echo "# main is $main" >&2

# https://www.unix.com/shell-programming-and-scripting/59605-trap-key-press-script.html
# https://www.geeksforgeeks.org/stty-command-in-linux-with-examples/
#tput cnorm
# livinfree's neat dd trick from that other thread vino pointed out
#tput smso
#echo "Press any key to return \c"
#tput rmso
oldstty=`stty -g`
#stty -icanon -echo min 1 time 0
#dd bs=1 count=1 >/dev/null 2>&1
#stty "$oldstty"
#echo

#kill $main

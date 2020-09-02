#!/usr/bin/env bash
trap catch INT
function catch(){
    tput cnorm
    exit 0
}
flagRA=('▁' '▁' '▁' '▂' '▂' '▃' '▄' '▅' '▆' '▇' '█' '█' '█' '▇' '▇' '▆' '▅' '▄' '▃' '▃' '▂' '▂' '▁')
lineRA=('█' '█' '█' '█' '█' '█' '█' '█' '█' '█' '█' '█' '█' '█' '█' '█' '█' '█' '█' '█' '█' '█' '█')
flaglen=20
flagchars=${#flagRA[@]}
colors=(227 221 215 209 203 204 205 206 207 171 135 99 63 69 75 81 87 86 85 84 83 119 155 191)
line2=(227 231 16 16 16 231 221 215 209 203 204 205 206 207 171 135 99 63 69 75 81 87 86 85 84 83 119 155 191)
line3=(227 16 231 16 231 16 221 215 209 203 204 205 206 207 171 135 99 63 69 75 81 87 86 85 84 83 119 155 191)
line4=(227 16 16 214 16 16 221 215 209 203 204 205 206 207 171 135 99 63 69 75 81 87 86 85 84 83 119 155 191)
line5=(227 214 16 231 16 214 221 215 209 203 204 205 206 207 171 135 99 63 69 75 81 87 86 85 84 83 119 155 191)

indexes=(colors line2 line3 line4 line5 colors)

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
    for lineNumber in {0..5}; do
	charindex=$charoffset	
	colorindex=$coloroffset
        ## Column loop
	i=0
	while (( $i < $flaglen )); do
	    if (( $lineNumber == 0 ));then
		# test without setting 0m each time?
		printf "\033[38;5;%sm%s" ${colors[$colorindex]} ${flagRA[$charindex]}
	    elif (( $lineNumber == 5 ));then
		printf "\033[38;5;%sm\033[7m%s\033[0m" ${colors[$colorindex]} ${flagRA[$charindex]}
	    else
		printf "\033[38;5;%sm%s\033[0m" ${colors[$colorindex]} ${lineRA[$charindex]}
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
    let "coloroffset++"
    sleep 0.2
    printf "$UPLINE$ERASELINE$UPLINE$ERASELINE$UPLINE$ERASELINE$UPLINE$ERASELINE$UPLINE$ERASELINE$UPLINE$ERASELINE"
    printf "\r   \033[38;5;94m█"
done

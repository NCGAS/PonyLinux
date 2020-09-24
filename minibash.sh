#/usr/bin/env bash
prompt=${1:-"> "}
#https://stackoverflow.com/questions/13057771/sigint-to-cancel-read-in-bash-script
# Works ok when it is invoked as a bash script
function reset_cursor(){
    echo    
}
trap reset_cursor INT
while true; do
    command=$( if read -e -p "$prompt" line ; then echo "$line"; else echo "quit"; fi )
    if [[ "$command" == "quit" ]] ; then
	exit
    else 
	history -s $command
	eval "$command"
    fi
done
trap SIGINT

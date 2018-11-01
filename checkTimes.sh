files=*
for file in $files; do
    birth=$(stat -f "%SB" $file)
    access=$(stat -f "%Sm" $file)
    if [[ ! $birth == $access ]]; then
	echo "File $file was born on $birth but modified on $access"
    else
	echo "File $file has not been accessed since birth"
    fi 
done

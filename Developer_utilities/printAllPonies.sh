while read line; do
#    echo $line
#    echo "break"
    ponysay -F $line "$line"
    #sleep 1
done <ponylist

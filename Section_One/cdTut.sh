function cdTut(){
    ponysay -b round -F pinkie 'Hi! I'\'$'ll be your instructor for the lesson on getting around in Unix.'
    read -p "Press enter to continue"
    clear
    getWrap
    ponygo pinkiebounce $'Whenever you are logged into a Unix system using a shell, you have a location - also called a directory or a folder.'
    ponygo pinkie $'You start out a new shell session from your home location. A home is where you sleep, so it makes sense that this is where you wake up!\n\nYou can always find out where you are by typing in pwd and hitting enter. Now you try it.'
    getInput 'pwd' "Not quite."
    echo "Great! You are currently in:"
    pwd
    read -p "Press enter to continue"
    clear
    getWrap
    ponysay -b round --wrap $PONYWRAP -F pinkiebounce $'Directories in Unix are hierarchical, which means that a directory can contain other directories in a nested way.\n\nDirectories inside the current directory are called subdirectories. The directory that contains your current location is called the parent directory. \n\nIn the bash shell, the current directory can be denoted by a shorthand of one dot, or period: ".". The parent is two dots: "..". There isn'\'$'t a three dot shorthand though.'
    read -p "Press enter to continue"
    clear
    ponysay -b round --wrap $PONYWRAP -F pinkie $'To move to a different location, you will use the cd command. cd stands for change directory. \n\nThink of it as opening a door, and going from one room into another. \n\nTo go up a directory, you would use the cd command followed by two dots. You should try it! '
    getInput 'cd ..' "Make sure you have a space between cd and the two dots."
    cd ..
    echo "No errors were printed, so it worked! You are currently in:"
    pwd
    read -p "Press enter to continue"
    clear
    ponysay -b round --wrap $PONYWRAP -F pinkiebounce $'Sometimes, you want to backtrack to where you just were. For this, you can use cd with the minus sign, or dash. Try it:'
    getInput 'cd -' "Make sure you have just one dash."
    echo "Now you backtracked to:"
    cd -
    #pwd
    clear
    ponysay -b round --wrap $PONYWRAP -F pinkiesilly $'You can only backtrack one step. If you keep typing in cd -, you'\'$'ll just bounce back and forth between two directories. Check it out:'
    getInput 'cd -' "Make sure you have just one dash."
    echo "And now you are back to:"
    cd -
    read -p "Press enter to continue"
    clear
    getWrap
    ponysay -b round --wrap $PONYWRAP -F pinkie $'Have you seen a squiggly line, like ~? This character is called a tilde, and it stands for your home directory in Unix. You can use it with the cd command to, like:\ncd ~\nThere is an even easier way, though. The cd command (by itself and with nothing after it) also takes you back home. No matter how lost you are, or how hard you party, you can always get home with just cd.'
    getInput 'cd' "Don't give up!"
    echo "Now you are back home!"
    cd
    pwd
    read -p "Press enter to continue"
    clear
    getWrap
    ponysay -b round --wrap $PONYWRAP -F pinkiecannon "Great job! You are done with the first section. Good luck, $PONYUSER!"
    read -n 1 -r -p "Press any key to continue"
    echo "cdtutdone:  (Done)" >> ~/.unixTut/config
}

# This is added in case the script is invoked instead of sourced
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    me="$( cd "$(dirname "$0")" ; cd ../ ; pwd -P )"
    source ${UNIXTUT:-$me}/Utilities.sh
    if [[ -z $PONYUSER ]]; then
        checkProgress
    fi
    cdTut
fi
#!/usr/bin/env bash

echo "tut dir is ${UNIXTUT}"
source ${UNIXTUT}/Utilities.sh

#exit $?

    ponysay -b round -F pinkie 'Hi! I'\'$'ll be your instructor for the lesson on getting around in Unix.\nYou might be used to a window environment that has fancy things like mouse access and menus. \nIt might be hard to get used to doing things without windows, but a hero like you should have no problem!'
    read -p "Press enter to continue"
    clear

    ponysay -b round -F pinkiebounce $'What you are looking at now is called a shell - it'\'$'s a program that lets you interact with the underlying computer operating system. \n\nThe specific shell you are using is called Bash, and it has its own kind of language. You issue commands to the bash shell and it executes those commands. \n\nSome commands don'\'$'t seem to do anything after you hit enter! \nThey just return a new line and show some stuff followed by a $ character. This is called a prompt, because it is prompting you to tell it what to do. \n\nNo output is usually a good sign in Unix! If a command fails, it usually tells you.'
    read -p "Press enter to continue"
    clear
    ponysay -b round -F pinkie $'Whenever you are logged into a Unix system using a shell, you have a location - also called a directory or a folder. \n\nYou start out a new shell session from your home location. A home is where you sleep, so it makes sense that this is where you wake up!\n\nYou can always find out where you are by typing in pwd and hitting enter. Now you try it.'
    getInput 'pwd' "Not quite."
    echo "Great! You are currently in:"
    pwd
    read -p "Press enter to continue"
    clear
    ponysay -b round -F pinkiebounce $'Directories in Unix are hierarchical, which means that a directory can contain other directories in a nested way.\n\nDirectories inside the current directory are called subdirectories. The directory that contains your current location is called the parent directory. \n\nIn the bash shell, the current directory can be denoted by a shorthand of one dot, or period: ".". The parent is two dots: "..". There isn'\'$'t a three dot shorthand though.'
    read -p "Press enter to continue"
    clear
    ponysay -b round -F pinkie $'To move to a different location, you will use the cd command. cd stands for change directory. \n\nThink of it as opening a door, and going from one room into another. \n\nTo go up a directory, you would use the cd command followed by two dots. You should try it! '
    getInput 'cd ..' "Make sure you have a space between cd and the two dots."
    cd ..
    echo "No errors were printed, so it worked! You are currently in:"
    pwd
    read -p "Press enter to continue"
    clear
    ponysay -b round -F pinkiebounce $'Sometimes, you want to backtrack to where you just were. For this, you can use cd with the minus sign, or dash. Try it:'
    getInput 'cd -' "Make sure you have just one dash."
    echo "Now you backtracked to:"
    cd -
    #pwd
    clear
    ponysay -b round -F pinkiesilly $'You can only backtrack one step. If you keep typing in cd -, you'\'$'ll just bounce back and forth between two directories. Check it out:'
    getInput 'cd -' "Make sure you have just one dash."
    echo "And now you are back to:"
    cd -
    read -p "Press enter to continue"
    clear
    ponysay -b round -F pinkie $'Have you seen a squiggly line, like ~? This special character, called a tilde, stands for your home directory in Unix. You can use with the cd command to, like:\ncd ~\nThere is an even easier way, though. The cd command, by itself, with nothing after it, also takes you back home. No matter how lost you are, or how hard you party, you can always get home with just cd.'
    getInput 'cd' "Don't give up!"
    echo "Now you are back home!"
    cd
    pwd
    read -p "Press enter to continue"
    clear
    ponysay -b round -F pinkiecannon "Great job! You are done with the first section. Good luck, $name!"
    read -n 1 -r -p "Press any key to continue"
    echo "cdtutdone:  (Done)" >> ~/.unixTut/config
    menu
}
function dirtut(){
    ponysay -b round -F rainbow 'Hi there. I'\'$'ll be teaching you more gory details about directories. \n\nSo you learned how to cd around, huh? But how do you know where to go, or what commands you can run?'
    read -p "Press enter to continue"
    clear

    ponysay -b round -F rainbowfirm $'The first thing you want to learn, is what directories come standard in Unix.\n\n If you do cd .. until you get dizzy, you will end up in the mega-parent directory. This directory is called the root directory, and it is denoted by a forward slash: "/". \n\nThe root directory is like the base of a tree, and all other directories grow out from it. Since directories are hierarchical, you can think of it like a tree with thick branches that split off into smaller and smaller ones, all the way down to the leaves.\n\nYou noticed that your location always starts with a / when you do pwd, right?'
    echo "Your current location:"
    pwd
    read -p "Press enter to continue"
    clear
# add note that you don't have to be inside directory to run a command
    ponysay -b round -F rainbowsalute $'Inside the root directory, there are a few folders you should know about. One is the /bin directory, which contains commands that you might want to run, like bash itself. Bin stands for binary, which is the format that many commands are in - binary machine code which is ready to talk to the operating system directly. Binary files are hard to read by humans.\n\nAnother good directory to know is /usr/local, which has code in it customized to this computer. \n\nThe /lib and /lib64 directories contain libraries, which are software codes that are intended to be put inside other code and work in a modular way. \n\n The /tmp directory is a place you might end up putting temporary files that are generated while a command runs.\n\n/etc, /var, /proc, and /sbin are usually locked down to only admins - they contain operating system files. '
    read -p "Press enter to continue"
    clear

    ponysay -b round -F rainbowfly $'Okay, so now you know a little bit about the structure of Unix directories. How do you find out what'\'$'s in them? The next command you should know is ls'
    getInput 'ls' "Make sure it's a lowercase L followed by s. You don't need anything after it."
    #read -p $'Type in the command, cd  \n $ ' variable1
    #while [[ $variable1 != *"ls"* ]]; do
    #    read -p $"Don't give up! Try the command, ls \n $ " variable1
    #done
    ls
    read -p "Press enter to continue"
    clear

    ponysay -b round -F rainbowhurricane 'Great job, '$name'! Now get out there and be victorious!'
    read -n 1 -r -p "Press any key to continue"
    clear
# more about ~, and how it doesn't have /~
# more about ls
#which


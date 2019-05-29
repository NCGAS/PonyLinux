#!/usr/bin/env bash
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

    menu
}

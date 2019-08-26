function permTut(){
    # Available applejacks:
    # applejack applejackscarecrow fillyjacktravel fillyjack

    mkdir -p tmptut
    cd tmptut
    mkdir -p castle/foyer
    ponyNoClear applejack $'Howdy, '$PONYUSER'. I'\'$'m going to teach you all about users and permissions in Unix.\nLet'\'$'s start by grabbing some supplies from the pony castle!  We'\'$'ll need to get you some food and some armor!'
    read -n 1 -r -p "Press any key to continue"
    clear

    ponygo applejackscarecrow $'Now that the princess is missing, we are keeping the castle locked... We'\'$'ll need to make sure we have PERMISSION to enter.\n\nUNIX PERMISSIONS control who can access folders and directories.  Let'\'$'s check who has permission to access the castle.'

    ponyNoClear applejack 'First, let'\'$'s see what the permission code is - try using the command: ls -lah'
    #'
    getInput 'ls -lah' "Don't give up! Did you remember the dash?"
    ls -lah
    echo ""
    echo ""
    echo "Good job!"
    read -p "Press enter to continue"
    clear

    getWrap
    ls -lah castle

    ponyNoClear applejack $'The ls -lah castle command lets us see the long list (-l) for all files (-a) in a human readable way (-h).  There are three things listed in the castle - . (current directory), .. (directory above), and castle (a directory location we can go!).  But first, we have to see if we have permission to go - otherwise the guards will be mad!'
    read -n 1 -r -p "Press any key to continue"
    clear

    getWrap
    ls -lah | tail -n 1
    ponyNoClear applejack $'That first part of each line: \n\ndrwxrwx---\n\nis the permission code'
    read -n 1 -r -p "Press any key to continue"
    clear

    getWrap
    ls -lah castle

    ponyNoClear applejack $'Let'\'$'s look at the different parts of the code separately. \n\nWe can write the code in a more readable way:\n\nd rwx rwx ---\n\nThe first part means the castle is a Directory, but what about the three sets after?'
    read -n 1 -r -p "Press any key to continue"
    clear

    getWrap
    ponyNoClear applejack $'r stands for read, w stands for write, and x stands for execute.  For files, this is pretty straightforward - you can read or write to the file, and if it'\'$'s a program or script, you can run it (execute).\n\nFor a directory, read means you can see what'\'$'s in the directory (ls), write means you can write to a file (nano), and execute means you can enter the file (cd).  \n\nBut why three sets of permissions??'
    read -n 1 -r -p "Press any key to continue"
    clear

    ponyNoClear applejack $'There are three groups of users in Unix Permissions - owner (also called user), group, and other.  The owner is usually who made the file, groups are defined sets of users, and other is everyone else.'
    read -n 1 -r -p "Press any key to continue"
    clear

    ponyNoClear applejack $'One persniketty thing about Unix is that spaces are a big issue. It'\'$'s really hard to include spaces in file names and even user names; the computer won'\'$'t refer to you by Firstname Lastname like would be polite. Instead, your username is usually all lowercase and 8 or so characters long.'
    ponyNoClear applejack $'My name is applejack, but my username, apjack19, is what gets used for permissions. So, while your name is '$PONYUSER', you will need to know your username.  You can do this by asking "who am I", but really quick - the command is whoami.\n\nAsk the computer an existential question!'
    getInput 'whoami' 'Try again!'
    whoami
    read -n 1 -r -p "Press any key to continue"
    clear

    ponyNoClear applejack $'I belong to the group of pony guardss and the team of pony guides.  You can belong to several groups, just like I do.  What groups do you belong to?  You can use the id command to find out!'
    getInput 'id' 'Try again!'
    id

    read -n 1 -r -p "Press any key to continue"
    clear

    echo "uid=1002($uid) gid=1002($uid) groups=1002($uid),100(users),134(ponies)"
    ponyNoClear applejack $'We made you an honorary pony for helping us, so you will see the ponies group in your ids!  \n\nTo understand the others designation, you we need to look at the permissions again.'
    getInput 'ls -lah' 'Try again!'
    echo "total 12K"
    echo "drwxrwxr-x 3 $uid $uid 4.0K Aug  9 12:25 ."
    echo "drwxrwxr-x 3 $uid $uid 4.0K Aug  9 12:25 .."
    echo "drwxrwxr-x 2 princess ponies 4.0K Aug  9 12:25 castle"
    read -n 1 -r -p "Press any key to continue"
    clear

    echo "total 12K"
    echo "drwxrwxr-x 3 $uid $uid 4.0K Aug  9 12:25 ."
    echo "drwxrwxr-x 3 $uid $uid 4.0K Aug  9 12:25 .."
    echo "drwxrwx--- 2 princess ponies 4.0K Aug  9 12:25 castle"
    ponyNoClear applejack $'After the first permissions block, the computer lists the owner of the file and then the group the file belongs to.  \n\nThe owner of the castle (the Princess!), can read, write, and execute (rwx).  Any of the poniess group can do the same!  Everyone not in the designated group is an "other" and is locked out (---) - the Princess is missing after all!'
    read -n 1 -r -p "Press any key to continue"
    clear

    echo "total 12K"
    echo "drwxrwxr-x 3 $uid $uid 4.0K Aug  9 12:25 ."
    echo "drwxrwxr-x 3 $uid $uid 4.0K Aug  9 12:25 .."
    echo "drwxrwx--- 2 princess ponies 4.0K Aug  9 12:25 castle"
    ponyNoClear applejack $'The princess still owns the castle, but as a member of team ponies, you have permission to enter without the guards locking us up! Let'\'$'s get a move on and enter the castle directory!'
    getInput 'cd castle' 'Try again!'
    read -n 1 -r -p "Press any key to continue"
    clear

    ponyNoClear applejack $'Let'\'$'s have look around! Use ls -lah again to see what is in the castle and where we'\'$'re allowed to go.'
    getInput 'ls -lah' 'Try again!'
    echo "total 20K"
    echo "drwxrwx--- 2 princess ponies 4.0K Aug  9 12:25 ."
    echo "drwxrwxr-x 3 $uid $uid 4.0K Aug  9 12:25 .."
    echo "drwxrwx--- 3 princess ponies 4.0K Aug 9 12:25 kitchen"
    echo "drwxrwx--- 3 princess ponies 4.0K Aug 9 12:25 armory"
    echo "drwx------ 3 princess princess 4.0K Aug 9 12:25 royal_quarters"
    read -n 1 -r -p "Press any key to continue"
    clear

    echo "total 20K"
    echo "drwxrwx--- 2 princess ponies 4.0K Aug  9 12:25 ."
    echo "drwxrwxr-x 3 $uid $uid 4.0K Aug  9 12:25 .."
    echo "drwxrwx--- 3 princess ponies 4.0K Aug 9 12:25 kitchen"
    echo "drwxrwx--- 3 princess ponies 4.0K Aug 9 12:25 armory"
    echo "drwx------ 3 princess princess 4.0K Aug 9 12:25 royal_quarters"
    ponyNoClear applejack $'Well, we can'\'$'t go into the Royal Quarters - only the Princess can.  Let'$'\'s go grab some grub to fuel our adventure!'
    getInput 'cd kitchen' 'Try again!'
    read -n 1 -r -p "Press any key to continue"
    clear

    ponyNoClear applejack $'Let'\'$'s see what we can find in this kitchen! Use ls -lah again to see what who has what food...'
    getInput 'ls -lah' 'Try again!'
    echo "total 14K"
    echo "drwxrwx--- 2 princess ponies 4.0K Aug  9 12:25 ."
    echo "drwxrwx--- 3 princess ponies 4.0K Aug  9 12:25 .."
    echo "-rw-rw---- 3 apjack19 ponies 2.0K Aug 9 12:25 apples"
    echo "-rw-rw---- 3 apjack19 apjack19 2.0K Aug 9 12:25 candy"
    echo "-rw------- 3 $uid ponies 2.0K Aug 9 12:25 travelpack"
    read -n 1 -r -p "Press any key to continue"
    clear

    echo "total 14K"
    echo "drwxrwx--- 2 princess ponies 4.0K Aug  9 12:25 ."
    echo "drwxrwx--- 3 princess ponies 4.0K Aug  9 12:25 .."
    echo "-rw-rw---- 3 apjack19 ponies 2.0K Aug 9 12:25 apples"
    echo "-rw-rw---- 3 apjack19 apjack19 2.0K Aug 9 12:25 candy"
    echo "-rw------- 3 $uid ponies 2.0K Aug 9 12:25 travelpack"
    ponyNoClear applejack $'You can see we brought your travelpack into the kitchen for storage.  I also have my private stash of candy and the apples I share with all the ponies. Notice these are files, not directories - the permission block starts with a - instead of a d!  Also, there is no x, because these are not directories or programs.'
    read -n 1 -r -p "Press any key to continue"
    clear

    ponyNoClear applejack $'Let'\'$'s take the apples and your travel pack. I'\'$'ll keep my candy here for the celebration.\n\nSince you have (w)rite permissions to the apples, you can also remove them from the directory (and pocket them for the adventure).'
    getInput 'rm apples' 'Try again!'
    read -n 1 -r -p "Press any key to continue"
    clear

    ponyNoClear applejack $'Keep in mind anyone with (w)rite permissions to your files, including as a group member, can remove your files like we just did with the apples.\n\nWe should make sure we can share the travelpack with the other ponies that are helping you, so we have to learn how to change the permissions of a file'
    read -n 1 -r -p "Press any key to continue"
    clear

    ponyNoClear applejack $'To change the permissions, we use a command chmod (change mode).  The command needs to know what new permissions you want and what file you want to change.  The command looks like this:\n\nchmod g+r travelpack.  Give it a try.'
    getInput 'chmod g+r travelpack' 'Try again!'
    read -n 1 -r -p "Press any key to continue"
    clear

    ponyNoClear applejack $'We used g+r to add (r)ead to the (g)roup.  You can also remove permissions the same way, for example remove x from others (o-x) or write from owner (also called user u-w). \n\nAlways double check that what you wanted to happen happened! Use ls -lah (again!) to see the new permissions.'
    getInput 'ls -lah' 'Try again!'
    echo "total 14K"
    echo "drwxrwx--- 2 princess ponies 4.0K Aug  9 12:25 ."
    echo "drwxrwx--- 3 princess ponies 4.0K Aug  9 12:25 .."
    echo "-rw-rw---- 3 apjack19 apjack19 2.0K Aug 9 12:25 candy"
    echo "-rw-r----- 3 $uid ponies 2.0K Aug 9 12:25 travelpack"
    read -n 1 -r -p "Press any key to continue"
    clear

    ponyNoClear applejack $'The other ponies might want to give you stuff to put in your travel pack, so let'\'$'s give them the ability to modify (write) that file.'
    getInput 'chmod g+w travelpack' 'Try again!'
    read -n 1 -r -p "Press any key to continue"
    clear

    ponyNoClear applejack $'Again, always double check that what you wanted to happen happened! Use ls -lah (again!) to see the new permissions.'
    echo "total 14K"
    echo "drwxrwx--- 2 princess ponies 4.0K Aug  9 12:25 ."
    echo "drwxrwx--- 3 princess ponies 4.0K Aug  9 12:25 .."
    echo "-rw-rw---- 3 apjack19 apjack19 2.0K Aug 9 12:25 candy"
    echo "-rw-rw---- 3 $uid ponies 2.0K Aug 9 12:25 travelpack" 
    read -n 1 -r -p "Press any key to continue"
    clear

    ponyNoClear applejack $'Okay, let'\'$'s remove that travelpack as well, and then head on over to the armory.'
    getInput 'rm travelpack' 'Try again!'
    read -n 1 -r -p "Press any key to continue"
    clear

    ponyNoClear applejack $'Come on! Time to go to the armory. Remember how to mv to a directory above the one you are in? With cd ..!  You can also make the hop to the armory in the same command.  Race you!'
    getInput 'cd ../armory' 'Try again!'
    read -n 1 -r -p "Press any key to continue"
    clear

    ponyNoClear applejack $'Wow, you are fast! Good thing you are our hero!  \n\nAs with every new room, let'\'$'s see what we have in here.'
    getInput 'ls -lah' 'Try again!'
    echo "total 12K"
    echo "drwxrwx--- 2 princess ponies 4.0K Aug  9 12:25 ."
    echo "drwxrwx--- 3 princess ponies 4.0K Aug  9 12:25 .."
    echo "-rw-rw---- 3 apjack19 ponies 2.0K Aug 9 12:25 sword"
    echo "-rw------- 3 $uid $uid 2.0K Aug 9 12:25 other_weapons"
    read -n 1 -r -p "Press any key to continue"
    clear

    ponyNoClear applejack $'Let'\'$'s grab that sword and share the other weapons someone was nice enough to give you with the other ponies, so they can help along the way!'
    read -n 1 -r -p "Press any key to continue"
    clear

    ponyNoClear applejack $'You want to tell the computer that you want to change the group, what you want to change it to, and what you are changing.  So in this case, the command is as follows - give it a try!\n\nchgrp ponies other_weapons'
    getInput 'chgrp ponies other_weapons' 'Try again!'
    read -n 1 -r -p "Press any key to continue"
    clear

    ponyNoClear applejack $'Always double check that what you wanted to happen happened! Use ls -lah (again!) to see the new permissions.'
    getInput 'ls -lah' 'Try again!'
    echo "total 12K"
    echo "drwxrwx--- 2 princess ponies 4.0K Aug  9 12:25 ."
    echo "drwxrwx--- 3 princess ponies 4.0K Aug  9 12:25 .."
    echo "-rw-rw---- 3 apjack19 ponies 2.0K Aug 9 12:25 sword"
    echo "-rw------- 3 $uid ponies 2.0K Aug 9 12:25 other_weapons"
    read -n 1 -r -p "Press any key to continue"
    clear

    ponyNoClear applejack $'Alright, let'\'$'s remove that sword and move on to learning how to working with files!'
    getInput 'rm sword' 'Try again!'
    read -n 1 -r -p "Press any key to continue"
    clear

    echo "permtutdone: (Done)" >> ~/.unixTut/config
}

# This is added in case the script is invoked instead of sourced
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    me="$( cd "$(dirname "$0")" ; cd ../ ; pwd -P )"
    source ${UNIXTUT:-$me}/Utilities.sh
    if [[ -z $PONYUSER ]]; then
        checkProgress
    fi
    findTut
fi
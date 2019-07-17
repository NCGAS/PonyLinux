#!/usr/bin/env bash

ponysay -b round -F applejack 'Howdy, '$name'. I'\'$'m going to teach you all about users in Unix.\n\nWell, you are using it right now, so you are a Unix user! \n\nOne thing about Unix is that spaces are a big issue. It'\'$'s really hard to include spaces in directory names, file names, and commands. \n\nThe same applies to user names; the computer won'\'$'t refer to you by Firstname Lastname like would be polite. Instead, your username is usually all lowercase and 8 or so characters long. You logged in, so maybe you already know it, but to find your username, type the id command.'
    read -n 1 -r -p "Press any key to continue"
    clear
#id
#permissions
#rwx
#chmod
#chgrp


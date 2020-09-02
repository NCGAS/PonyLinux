=== For developers! ===

=== FAQ ===
What does the “$” mean in bash scripting? How would a developer know when, or not when to use it?
  
  In bash, the $ is a way to refer to a variable. Unlike other languages which might use the $ all the time (perl, php), or not at all (python, vanilla javascript), bash uses the $ only when referring to a variable but not when creating/initializing one.
  ```For example, I want to set fave_color to purple:
  export favecolor=purple
  No $! But if I want to use it:
  echo "My favorite color is $favecolor" ```
  
  You may also see it used to invoke a subshell. I could set color this way:
  
  ```export favecolor=$(echo "purple")```

There are other cases, too, but that's the major ways I use it.

How could we understand how to write if-then statements in bash scripting?

How could we better teach someone who is a novice to bash scripting, how to write functions in bash?

Look at a piece of code:

```if [[ -e .monster ]]; then
    echo "With a daring charge, you hack through the monster before you, dispatching it with one swing of your weapon. It fades away with an eerie laugh echoing from all around you."
    echo -e "function monsterrun(){ \necho 'There is a small spot of soot on the floor where once stood a frightful beast.' \n}" > .monster```

What does -e stand for? Why does monster have a period before it, and what does it do at the end of the code?

-e checks if a file exists. The . before the monster makes it a hidden file, which won't show up with a simple ls.
    
What does ‘case’ do in bash?

Case is used if there are a lot of possibilities in your program's flow, and you want to handle each case differently. It simplifies if/else statements so you don't need a million elsifs, like fave_animal == 'cat' or 'dog' or 'hyena' =)

What is $TERM?

This tells us what flavor of 'terminal emulator' we are using. Old school computers had terminals which really did interface more directly with the computer, but nowadays that's all abstracted into software. 

Terminal $TERM determines certain behaviors and what things are supported, such as colors and the results of running certain commands.

How do we declare globals? How do we go about writing one?

Bash variables are global by default. This can really trip you up. If you want to restrict the scope, you actually use local variablename=something.

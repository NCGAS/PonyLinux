echo "Welcome to 'Linux Mathematics'!"
echo "Don't worry, we're not testing you on anything crazy, we're just going to have a little fun."
echo "So fire up your left hempishphere, and get ready to do some math with the concepts you learned!"
echo "So here are some instructions on how to play:"
echo "You are going to get a bash command that you learned, and count the number of characters that are there."
echo "Once you do that, you will be asked how many characters you think it is, and it will output the number of characters times itself."
echo "Sound like a good deal? Alright, let's start!"



echo "How many characters are in 'stdout'?"
read n
WRONGANSWER=$n
if [[ ( $n == 5 || $n  != $WRONGANSWER ) ]]
then
echo "You got it! Here's the multiplication result!"
expr 5 \* 5
else
echo "Sorry, that's not correct."
fi

echo "Okay, now we're going to do something different."
echo "I'm going to give you a multiplied number, and you have to say what command you think it is, times itself."
echo "What would command '36' be? Type 'A' or 'B'"
echo -ne '\n'
echo "A. pipe"
echo "B. stderr"

read n2
B=B
A=$n2
if [[ ( $n2 == $B || $n2 != $A ) ]]
then
echo "You got it!"
echo "Here's a prize for all your hard work!"
xeyes
#cat peace.txt
else
echo "Sorry, that's the wrong command."
fi
echo -ne '\n'
echo "Thanks for playing!"
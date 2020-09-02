echo "Welcome to 'Cipher That Command'!"
echo "For this mini game, we will give you a cipher that you have to decode."
echo "If you get it correct, you'll unlock a special prize!"
echo "Who doesn't like prizes? I know I do. So here are some instructions on how to play:"
echo "Here are a list of numbers & symbols that correspond with a letter in the alphabet: "
rev cipher.txt
echo "Once you decipher what this each number stands for, you will enter your answer."
echo "If you get it right, you get a prize! If you don't, then oh well. :("
echo -ne '\n'

echo "13@r2b"
echo "looking at the letters and symbols, what command is it?"
read n
WRONGANSWER=$n
if [[ ( $n == stdout || $n  != $WRONGANSWER ) ]]
then
echo "YOU WON! Now you get a prize! Please wait while we load your prize..."
else
echo "You lost the game"
fi

sleep 5
echo -ne '\n'

if [[ ( $n == stdout  ) ]]
then
echo "Here's your prize!"
cat cow.txt
echo -ne '\n'
fi



echo "Now that you are a master at deciphering, let's do another! This time, the letters and symbols will be BACKWARDS!"
echo -ne '\n'
echo "Here are a list of numbers & symbols that correspond with a letter in the alphabet: "
rev cipher.txt
echo -ne '\n'
echo "&&*@31"
echo "looking at the letters and symbols, what command is it?"
read n2
WRONGANSWER2=$n2
if [[ ( $n2 == stderr || $n2  != $WRONGANSWER2 ) ]]
then
echo "YOU WON! Now you get a prize! Please wait while we load your prize..."
else
echo "You lost the game"
fi

sleep 5
echo -ne '\n'

if [[ ( $n2 == stderr  ) ]]
then
echo "Here's your prize!"
cat linux.txt
echo -ne '\n'
fi

echo "Thanks for playing!"
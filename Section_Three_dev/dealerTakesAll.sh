#!/bin/bash

desc=<<EOF
This game is intended to teach two concepts:
1. using grep with pipes to do simple counting
2. using awk with grep to manipulate tabular files

The challenge is thus:
A crooked dealer of cards has cheated and won a mcguffin from an innocent person. To get it back, you have to beat the dealer at his own game. Luckilly, an insider gives you information on what the dealer has in his deck!

Cheatsheet one:
Ace of Spades
Two of Clubs
Three of Diamonds 
Five of Hearts
Three of Clubs
Jack of Hearts
....

The cheatsheet should be long enough that it's hard to count by hand (or std 52 card deck). But essentially it will be stacked heavy on one suit!

Tweak the playing of this game until a happy balance is found between # of tries, how many in the deck etc. The dealer shows a card and you have to guess the suit.

If the player wins, the dealer is irate and demands a winner-takes-all rematch. But this time he pulls out several decks. 

Cheatsheet two
Deck1	Deck2	Deck3	Deck4
Diamonds	Clubs	Clubs	Hearts
Diamonds	Clubs	Spades	Hearts
Diamonds	Clubs	Clubs	Hearts
Diamonds	Clubs	Clubs	Hearts
....
Each deck is stacked for a different suit. Each time the dealer deals he first picks a deck and you have to guess the suit!

Other tweaks: add numbers to the decks as well; make the first n guesses free but start charging after that, etc!

EOF

ponygo trixiestage "Welcome one and all to my table!"
ponygo trixielulamoon "Hah! I won that round!"
ponygo trixiestand "You'll never guess my cards"
ponygo trixieamulet "Hmm, well done"

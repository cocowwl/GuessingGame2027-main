# Guessing game 
 
You are guessing a number of the chamber that is randomized by the computer and  you may use the color hints and hint button to help you get the number and gain coins

## How to play
 
1. you start with a number you want to try guessing and check if your number is right or not
2. you may keep trying until you get the right number 

## What I added
 
- I've added warm or cold hints by adjusting the colors of the screen when you get closer or further from the secret number (*WHY*:colors are easier to differ from each other and instead of adding boring text I chose to change the color to also give the player more entertainment on this easy game)
- I've added difficulty levels now at the top of the game you may choose easy medium or hard games that gives you number ranges from 1-10, 1-100, 1-1000(*WHY*: 1-100 may be too hard for some people and too easy for others so instead of going to a new game now I intergrated all three modes that you could choose from according to your own level)
- I've added the best score/ record for the game now if you keep playing for a while you can see your best record which is the least time used to guess the secret number(*WHY*: some people may want to keep track on how many trials they used for a guess instead of not recording or recording all of them I recorded the least guesses you used and set it as a record now you can beat your own record)
- I've added a hint button to show a hint of if the number is even or odd at the bottom of the game to help (*WHY*: sometimes you may be super stuck and wanna quit this game with this button you get a free hint of the secret number now it's easier for you to guess the number)
- I've added a theme to the game now instead of guessing numbers and being boring now we are opening chambers to earn coins which make the game better by changing the text(*WHY*: Now you are not simpily guessing numbers we are gaining coins in chambers to make the game better and more entertaining for player)
- I've changed the symbols next to the text guessing game at the top and the symbol when you get the right answer (*WHY*: the symbol did not fit with my theme so I changed my symbol to make the game look more related to the theme)
- I've added coins(points) system where you gain coins will automatically be recorded and if you guess the numbers in three guesses you gain 2 (*WHY*: Now when the text you gained a coin pop up you actually gained coins and shows below the record so you can keep track of)
- I've added the range function which is able to show the minimum possible value and the maximum possible value as you make a guess each time. (*WHY: for harder ones it would be too difficult to determine where the number is, therefore a range that closes up can help)

## TESTS
- *IF* In easy mode, the secret number was 3 then when you guess 1, 2, 4, 5, 6, 7 and 8 the color should show red and 9 and 10 will have the color orange shown *DATA* 1, 2, 4, 5, 6, 7 and 8 did show red and 9 and 10 showed orange *BECAUSE* secret number - guess was less or equal to 5 or -5
- *IF* I click on the word easy the guess count should be from 1 to 10 *DATA* it did show 1 to 10 and I stared guessing with the number 5 instead of 50 
- *IF* I used 5 time to guess the secret number my record should show record:5 *DATA* it did *BECAUSE* record=guess 
- *IF* the secret number was 7 my hint will show words The number is odd *DATA* yes it did *BECAUSE* 7 is a odd number and is programmed to show the odd and even of the secret number
- *IF* I start a new game in medium mode the text in the middle should say The coin is hidden in one of the chambers from 1 to 100 instead of guess a number or something similar *DATA* it showed The coin is hidden in one of the chambers from 1 to 100 *BECAUSE* the number range the mode was setted in and also because the theme change that differs from old one
 - *IF* I set my secret number as 7 and directly guess them twice I am going to gain 4 coins in total *DATA* it did give me 4 coins *BECAUSE* if guess count is less or equal to 3 you gain 2 coins and I guessed 7 twice in a row which makes 2 times 2 coins which makes 4
 - *IF* I set my secret number as 5 and guesses 6, the maximum value would show up as 6, and when I guesses 4, the minimum number would show up as 4. *DATA* The range did show up from 4 to 6 *BECAUSE* the maximum value from my guess by far is 6, and the minimum by far is 4, therefore the number must be 5
## Credits
 
- The guessing game was written by Coco.wang.



# Guessing game 
 
You are guessing a number of the chamber that is randomized by the computer and  you may use the color hints and hint button to help you get the number and gain coins

## How to play
 
1. Choose a Difficulty Mode: Tap Easy (1–10), Medium (1–100), or Hard (1–1000) at the top of the screen to select your number range.
2. Make a Guess: Use the "-100", "-10", "-1", "+1", "+10", and "+100" buttons to adjust your guess. Look at the range numbers on the left and right of your guess to see the remaining possible range.
3. Check for Hints:
   - Tap "Hint" Button to check if the secret number is even or odd.
   - Pay attention to the message background color: Red means hot (within 5), Orange means warm (within 15), and Blue means cold.
4. Earn Coins & Set Records: Tap Guess Button to confirm. Find the number in 3 or fewer guesses to earn 2 coins; otherwise, earn 1 coin. Try to beat your best Record (lowest number of guesses used).

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
| Test | Chosen input | Should happen | Did happen |
| :--- | :--- | :--- | :--- |
| **Color Hints** | Easy, secret fixed at 10. Guess 1, 2, 4, 5, 6, 7, 8, then 9 and 10 | 1, 2, 3, and 4 show orange; 5, 6, 7, 8, and 9 shows red | 1, 2, 3 and 4 did show orange, and 5, 6, 7, 8, and 9 showed red |
| **Easy Mode Range** | Click on Easy mode | Guessing range changes to 1 to 10 | Did show 1 to 10, and started guessing with 5 instead of 50 |
| **Record Tracking (Fewest Guesses)** | Win in 3 guesses, tap Play Again, then win in 5 guesses | Record stays at `Record: 3` (stores fewest guesses, not latest win) | Record remained at 3 after the second win |
| **Parity Hint** | Secret number set to 7, click Hint | Message displays "The number is odd" | Displayed "The number is odd" |
| **Medium Mode Message** | Start new game in Medium mode | Header text says "The coin is hidden in one of the chambers from 1 to 100" | Showed "The coin is hidden in one of the chambers from 1 to 100" |
| **Coin Reward Logic** | Secret set to 7, guess correctly in 3 or fewer tries twice | Gain 4 coins in total (2 coins x 2 wins) | Total coins increased by 4 |
| **Dynamic Bounds (Correct Ordering)** | On Medium, guess 5 (too low) | Message updates range to between 5 and 100, numbers show 5 and 100 | Message and bounds both updated to show 5 to 100 together |
| **Wild Guess Bounds Safety** | On Medium, guess 50 (too high), then guess 60 | Upper bound stays at 50 (does not widen back out to 60) | Upper bound remained capped at 50 |
| **Play Again Mode Retention** | Play in Hard mode (1–1000), win, tap Play Again | Game restarts in Hard mode (1–1000) instead of resetting to Easy | Message and bounds restarted from 1 to 1000 |
| **Victory Card Color** | Win the game | Message card stays Yellow and does not get overwritten by `colorHints()` Red | Card remained Yellow upon winning |
| **Color Distance Boundaries** | Distance is exactly 15 away from secret number | Background turns Orange (matches `else if` logic without dual triggering) | Card displayed Orange cleanly |
| **Initial Window Height** | Launch app window on macOS | Full title, game board, and bottom guess counter are completely visible | Window opened at 760 height displaying all elements without clipping |

 
 
 ## HOW IT WORKS

### Coin Reward System
- **Variables used:** `totalPoints` (`@State var`) to store the player's cumulative coin count, and `numberOfGuesses` (`@State var`) to keep track of total attempts made in the current round
- **Decision & Operators:** An `if-else` statement combined with the less-than-or-equal operator (`<=`) checks if `numberOfGuesses <= 3`. The addition assignment operator (`+=`) increments `totalPoints` by `2` for fast wins or by `1` otherwise
- **Why this tool:** I chose an `if-else` conditional structure over a `switch` statement because there are only two distinct outcome tiers (speedy win vs. standard win), making `if-else` clearer and more concise for binary conditions.
 
## Credits
 
- **Starter Game Code:** Created by Mr. R. Gordon.
- **Game Customizations & Enhancements:** Written by Coco Wang.

//
//  GuessingGameView.swift
//  GuessingGame
//
//  WHAT THIS GAME DOES NOW
//  The app picks a secret whole number from 1 to 100.
//  You choose a guess with the buttons and click Guess.
//  The app tells you if your guess is right or not right,
//  and it counts your guesses. When you find the number,
//  you can play again.
//
//  WHAT IT DOES NOT DO YET
//  It does not tell you if your guess is too high or too low.
//  That part is up to you.
//

import SwiftUI



// The game itself: what it remembers, what it shows on the screen,
// and what it does when you click a button.
struct GuessingGameView: View {

    // MARK: - Stored properties

    // Each @State variable is something the game remembers.
    // When one of them changes, the screen updates by itself.

    // The game's settings. They sit up here, outside the game,
    // so that every part of the game below can use them.
    // TRY: Change highestNumber to 10 for an easy game, or to 1000 for a hard one.
    @State var lowestNumber: Int = 1
    @State var highestNumber: Int = 100
    
    // The number the player is trying to find. The app picks it at random.
    @State var secretNumber: Int = Int.random(in: 1...100)

    // The guess the player is about to make. It starts in the middle.
    @State var guess: Int = (1 + 100) / 2

    // How many guesses the player has made in this game.
    @State var guessCount: Int = 0

    // The message shown to the player, with a symbol and a colour to match it.
    @State var message: String = "The key is hidden in one of the chambers from 1 to 100."
    
    @State var messageSymbol: String = "questionmark.circle.fill"
    @State var messageColor: Color = Color.indigo

    // Becomes true when the player finds the secret number.
    @State var gameIsOver: Bool = false

    // The record number
    @State var record: Int = 0
    
    //The text
    @State var parityHint: String = ""
    
    
    // MARK: - Computed properties

    var body: some View {
        VStack(spacing: 20) {

            // The title at the top of the screen.
            HStack {
                Image(systemName: "dollarsign")
                Text("Guessing Game")
            }
            .font(.largeTitle)
            .bold()
            .foregroundStyle(Color.indigo)
            // Shrink the title a little if it does not fit on one line.
            .lineLimit(1)
            .minimumScaleFactor(0.5)

            Spacer()
            
            //record feature
            Text("Record:\(guessCount)")
            
            //Buttons for different game modes
            HStack{
                Button("Easy"){
                    easyGame()
                }
                Button("Meduim"){
                    mediumGame()
                }
                Button("Hard"){
                    hardGame()
                }
            }
            // The message card: what the game has to say to you.
            VStack(spacing: 12) {
                Image(systemName: messageSymbol)
                    .font(.system(size: 60))
                    .foregroundStyle(messageColor)
                Text(message)
                    .font(.title2)
                    .multilineTextAlignment(.center)
            }
            .padding()
            .frame(maxWidth: .infinity, minHeight: 180)
            .background(messageColor.opacity(0.15))
            .clipShape(RoundedRectangle(cornerRadius: 24))
            
            // The guess you are about to make, shown nice and big.
            // TRY: Change the size of this number from 96 to something else.
            
            Text("\(guess)")
                .font(.system(size: 104, weight: .bold))
                .monospacedDigit()

            Text(parityHint)
            
            // Four buttons to change the guess.
            // The code inside the braces runs when that button is clicked.
            HStack(spacing: 8) {
                Button("-10") {
                    lowerGuessByTen()
                }
                Button("-1") {
                    lowerGuessByOne()
                }
                Button("+1") {
                    raiseGuessByOne()
                }
                Button("+10") {
                    raiseGuessByTen()
                }
            }
            .buttonStyle(.bordered)
            .font(.title3)
            .bold()
            .monospacedDigit()
            .disabled(gameIsOver)

            // Show the Guess button while the game is on,
            // and the Play Again button once the number is found.
            if gameIsOver {
                Button("Play Again", systemImage: "arrow.clockwise") {
                    startNewGame()
                }
                .buttonStyle(.borderedProminent)
                .tint(Color.green)
            } else {
                HStack{
                    Button("Guess", systemImage: "hand.point.up.left.fill") {
                        checkGuess()
                        colorHints()
                    }
                    .buttonStyle(.borderedProminent)
                    Button("Hint") {
                        if secretNumber % 2 == 0 {
                            parityHint = "The number is even."
                        } else {
                            parityHint = "The number is odd."
                        }
                        if !parityHint.isEmpty {
                            Text(parityHint)
                                .font(.headline)
                                .foregroundStyle(Color.purple)
                        }
                    }
                }

            }
            

            Text("Guesses so far: \(guessCount)")
                .font(.headline)
                .foregroundStyle(Color.secondary)
        }
        .padding(32)
        .font(.title2)
        .fontDesign(.rounded)
        .controlSize(.large)
        // TRY: Change indigo to another colour, such as teal, pink or orange.
        .tint(Color.indigo)
        // How big the game's window is on the Mac. It can be made taller or wider.
        .frame(minWidth: 420, minHeight: 640)
    }

    // MARK: - Functions

    // Checks the player's guess against the secret number.
    func checkGuess() {

        // One more guess has been made.
        guessCount += 1

        if guess == secretNumber {
            message = "Coin gained! Number \(secretNumber) was the correct chamber"
            messageSymbol = "dollarsign"
            messageColor = Color.yellow
            gameIsOver = true
            

        } else {
            // TRY: Change this message. Make it kinder, or sillier.
            message = "Empty! Number \(guess) isn't the right chamber "
            messageSymbol = "xmark.circle.fill"
            messageColor = Color.red

        }
    }
    
    // Warm and cold color hints
    func colorHints() {
        //define a new varibale to store the
        let relativeDistance = abs(guess - secretNumber)
        
        //if the number is within 5 from the secretnumber
        if relativeDistance <= 5 {
            messageColor = Color.red
        }
        //if the number is within 10 from the secretnumber
        if relativeDistance <= 15 && relativeDistance > 5 {
            messageColor = Color.orange
        }
        //if the number is within 15 from the secretnumber
        if relativeDistance >= 15 {
            messageColor = Color.blue
        }
    }
    
    //check the secret value
    
    // Makes the guess 10 smaller, but never smaller than the lowest number.
    func lowerGuessByTen() {
        guess -= 10
        if guess < lowestNumber {
            guess = lowestNumber
        }
    }

    // Makes the guess 1 smaller, but never smaller than the lowest number.
    func lowerGuessByOne() {
        guess -= 1
        if guess < lowestNumber {
            guess = lowestNumber
        }
    }

    // Makes the guess 1 bigger, but never bigger than the highest number.
    func raiseGuessByOne() {
        guess += 1
        if guess > highestNumber {
            guess = highestNumber
        }
    }

    // Makes the guess 10 bigger, but never bigger than the highest number.
    func raiseGuessByTen() {
        guess += 10
        if guess > highestNumber {
            guess = highestNumber
        }
    }

    // Picks a new secret number and resets everything else.
    func startNewGame() {
        secretNumber = Int.random(in: lowestNumber...highestNumber)
        guess = (lowestNumber + highestNumber) / 2
        guessCount = 0
        message = "The coin is hidden in one of the chambers from 1 to 100."
        messageSymbol = "questionmark.circle.fill"
        messageColor = Color.indigo
        gameIsOver = false
        parityHint = ""
    }
    
    //easy mode
    func easyGame() {
        lowestNumber = 1
        highestNumber = 10
        secretNumber = Int.random(in: lowestNumber...highestNumber)
        guess = (lowestNumber + highestNumber) / 2
        guessCount = 0
        message = "The coin is hidden in one of the chambers from 1 to 10."
        messageSymbol = "questionmark.circle.fill"
        messageColor = Color.indigo
        gameIsOver = false
        parityHint = ""
    }
    
    //medium mode
    func mediumGame() {
        lowestNumber = 1
        highestNumber = 100
        secretNumber = Int.random(in: 1...100)
        guess = (lowestNumber + highestNumber) / 2
        guessCount = 0
        message = "The coin is hidden in one of the chambers from 1 to 100."
        messageSymbol = "questionmark.circle.fill"
        messageColor = Color.indigo
        gameIsOver = false
        parityHint = ""
    }
    
    //hard mode
    func hardGame() {
        lowestNumber = 1
        highestNumber = 1000
        secretNumber = Int.random(in: 1...1000)
        guess = (lowestNumber + highestNumber) / 2
        guessCount = 0
        message = "The coin is hidden in one of the chambers from 1 to 1000."
        messageSymbol = "questionmark.circle.fill"
        messageColor = Color.indigo
        gameIsOver = false
        parityHint = ""
    }
}

#Preview {
    GuessingGameView()
}

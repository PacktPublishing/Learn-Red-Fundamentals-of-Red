Red [
    File: %guess-number1.red
    Author: "Ivo Balbaert"
    Description: {
        The program guesses a number from 1 till 99. You have to guess it.
    }
]

#include %../../../red-source/environment/console/input.red

random/seed now/time     
secret-number: random 99  
max-number-of-guesses: 10
number-of-guesses: 0

loop max-number-of-guesses [
    answer: ask "Type a number (from 1 till 99) or stop(S): "
    if answer = "S" [
        print "OK, you want to stop."
        break
    ]
    
    number-of-guesses: number-of-guesses + 1
    print ["--> Number of guesses:" number-of-guesses]
    if number-of-guesses > (max-number-of-guesses - 1) [
        print ["Sorry, too much guessing, the secret number was" secret-number]
        break
    ]   
    
    guessed-number: load answer

    if secret-number = guessed-number [
        print ["Congratulations. You guessed the number" secret-number "in" 
            number-of-guesses "times"]
        break
    ]

    either secret-number < guessed-number [
        print ["The secret number is smaller than" guessed-number]
        continue
    ][
        print ["The secret number is bigger than" guessed-number]
        continue
    ]
]

print "Thanks for guessing!"
# Matthew Seneque
# 10401788
# Ruby - Hangman

wordlist = ['australia', 'research', 'hangman', 'contact', 'locked', 'computer', 'notepad', 'beetroot', 'cucumber', 'headphones', 'keyboard', 'monitor', 'project', 'science', 'digital', 'chronograph', 'blazer', 'abracadabra', 'helicopter', 'pharmacy', 'restaurant', 'toothpaste', 'magician', 'redemption', 'survivor']

lettersLeft = ['a', 'e', 'i', 'o', 'u', 'b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'p', 'q', 'r', 's', 't', 'v', 'w', 'x', 'y', 'z']

# select random word
word = wordlist.sample

hang = ["\n   \n\n         9 guesses left\n\n\n...... ",
        "\n   \n\n         8 guesses left\n\n\n|\\.... ",
        "\n|   \n|\n|        7 guesses left\n|\n|\n|\\.... ",
        "____\n|   `\n|\n|        6 guesses left\n|\n|\n|\\.... ",
        "____\n|   `O\n|\n|        5 guesses left\n|\n|\n|\\.... ",
        "____\n|   `O\n|    |\n|    ^   4 guesses left\n|\n|\n|\\.... ",
        "____\n|   `O\n|   /|\n|    ^   3 guesses left\n|\n|\n|\\.... ",
        "____\n|   `O\n|   /|\\ \n|   .^   2 guesses left\n|   ]\n|\n|\\.... ",
        "____\n|   `O\n|   /|\\ \n|   .^.  1 guess left\n|   ] [\n|\n|\\.... ",
        "____\n|   |\n|   O\n|  /|\\  YOU ARE DEAD\n|   |\n|  /|  \n|\\.... "]
i = 0
lettersUsed = ''
wordsUsed = ''

puts "\nWELCOME TO RUBY HANGMAN\n"

while true do
    # print correct hangman diagram
    puts (hang[i])

    # print the guess history
    print "      "
    for letter in word.chars.each
        if lettersLeft.include? letter
            print "_"
        else
            print letter
        end
    end
    print "   #{word.length} letter word\n\nLetters used: #{lettersUsed} \n\nWords guessed: #{wordsUsed}\n"
    
    # Check if the word has been guessed
    if (word.chars.to_a & lettersUsed.split(" ")) == (word.chars.to_a & (lettersUsed.split(" ") + lettersLeft))
        print "\n\n   YOU WIN !!! \n\n"
        break
    end

    # stop if the guess limit has been reached
    if i == (hang.length - 1)
        print "\nYou have run out of guesses\n\n\n   YOU LOOSE !!! \n\n"
        print " The word was #{word.upcase} \n"
        break
    end

    # let the user input their guess
    print "\n\nGuess a letter or guess the word: "
    guess = gets 
    guess = guess.strip.downcase

    # proceed if the user enters a single letter from the letters left
    if (guess.length == 1) and (lettersLeft.include? guess)
        
        # the guess is a single letter
        if guess.length == 1
            lettersLeft.delete(guess)
            lettersUsed = lettersUsed + ' ' + guess
        end

        # guess matches single letter from the word
        if (word.include? guess) and (guess.length == 1)
            next
        end

    elsif guess == word
        print "\n\n   YOU WIN !!! \n\n"
        break

    elsif guess.length > 1
        wordsUsed = wordsUsed + ' ' + guess
        print "\n You have chosen the wrong word\n"

    else
        next
    end

    i = i + 1
end

puts ""

# Create an object-oriented number guessing class for numbers in the range 1 to 100

# Note that a game object should start a new game with a new number to guess with each call to #play.

class GuessingGame

  attr_reader :number_to_guess

  def initialize(guesses)
    @number_to_guess = rand(1..100)
    @@guesses_remaining = guesses
  end

  def user_enter_number
    ans = nil
    loop do
      puts "Pick a number 1 - 100"
      ans = gets.chomp.to_i
      break if (1..100).to_a.include?(ans)
      puts "Invalid, try again."
    end

    ans
  end

  def number_choice_locater(user_num)
    if user_num > number_to_guess
      puts "Number too high!" 
    else
      puts "Number too low!"
    end
  end
  
  def display_guesses_remaining
    puts "You have #{@@guesses_remaining} guesses remaining."
  end

  def winning_number?(user_num)
    if user_num == number_to_guess
      return true
    else
      @@guesses_remaining -= 1
      number_choice_locater(user_num)
      display_guesses_remaining
    end

    false
  end

  def out_of_guesses?
    @@guesses_remaining <= 0
  end

  def display_loser
    puts "You lose! It was #{@number_to_guess}."
  end

  def display_winner
    puts "You win!"
  end

  def display_goodbye
    puts "Thanks for playing!"
  end

  def game_loop
    loop do
      user_num = user_enters_number
      if winning_number?(user_num)
        display_winner 
        break
      elsif out_of_guesses?
        display_loser
        break
      end
    end
  end

  def play
    display_guesses_remaining
    game_loop
    display_goodbye
  end
end

game = GuessingGame.new(3)

game.play
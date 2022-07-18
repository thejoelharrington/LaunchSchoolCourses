class GuessingGame
  attr_reader :number_to_guess
  attr_accessor :range

  def initialize(max_range)
    @range = (1..max_range).to_a
    @number_to_guess = @range.sample
    @@max_guesses = Math.log2(@range.size).to_i + 1
  end

  def play
    display_guesses_remaining
    game_loop
    display_goodbye
  end

  private

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

  def reset_number_to_guess
    @number_to_guess = range.sample
  end

  def number_choice_locater(user_num)
    if user_num > number_to_guess
      puts "Number too high!" 
    else
      puts "Number too low!"
    end
  end
  
  def display_guesses_remaining
    puts "You have #{@@max_guesses} guesses remaining."
  end

  def winning_number?(user_num)
    if user_num == number_to_guess
      return true
    else
      @@max_guesses -= 1
      number_choice_locater(user_num)
      display_guesses_remaining
    end

    false
  end

  def out_of_guesses?
    @@max_guesses <= 0
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
    reset_number_to_guess
    loop do
      user_num = user_enter_number
      if winning_number?(user_num)
        display_winner 
        break
      elsif out_of_guesses?
        display_loser
        break
      end
    end
  end
end

game = GuessingGame.new(100)

game.play

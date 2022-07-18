=begin
  this version of rps keeps a history of moves by adding a
  history class and several new method defs.

  created History class and initialized two instance variables to represent
  human's move history and computer's move history respectively. created
  display methods to show the contents of those instance variables pointing
  to arrays with elements of past moves.placed those display methods inside
  grand_champion method in RPS class.
=end

# module Clearable
#   def clear_screen
#     system 'clear'
#   end
# end

class Move
  VALUES = ['rock', 'paper', 'scissors']

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def >(other_move)
    (paper? && other_move.rock?) ||
      (rock? && other_move.scissors?) ||
      (scissors? && other_move.paper?)
  end

  def <(other_move)
    (rock? && other_move.paper?) ||
      (paper? && other_move.scissors?) ||
      (scissors? && other_move.rock?)
  end

  def to_s
    @value
  end
end

class Player
  include Clearable
  attr_accessor :move, :name, :score

  def initialize
    set_name
    @score = 0
  end
end

class Human < Player
  def set_name
    n = nil
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Invalid, try again."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Choose rock, paper, or scissors:"
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts "Invalid, try again."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['Cortana', 'Siri', 'S voice', 'Clippy'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class History
  attr_accessor :human_history, :computer_history

  def initialize
    @human_history = []
    @computer_history = []
  end
end

class RPSGame
  include Clearable
  attr_accessor :human, :computer, :history

  MAX = 2

  def initialize
    @human = Human.new
    @computer = Computer.new
    @history = History.new
  end

  def save_history
    history.human_history << human.move
    history.computer_history << computer.move
  end

  def display_human_history
    print "#{human.name}'s history: "
    history.human_history.each_with_index do |mv, idx|
      print "(#{idx + 1}. #{mv}) "
    end
    puts ''
  end

  def display_computer_history
    print "#{computer.name}'s history: "
    history.computer_history.each_with_index do |mv, idx|
      print "(#{idx + 1}. #{mv}) "
    end
    puts ''
  end

  def display_welcome_msg
    puts "Welcome to rock, paper, scissors!"\
         " Whoever gets to #{MAX} first, wins!"
  end

  def display_goodbye_msg
    puts "Thanks for playing! Goodbye!"
  end

  def trace_and_display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
    save_history
  end

  def human_wins?
    if human.move > computer.move
      human.score += 1
      return true
    end
    false
  end

  def computer_wins?
    if computer.move > human.move
      computer.score += 1
      return true
    end
    false
  end

  def display_score
    puts "#{human.name}: #{human.score}"
    puts "#{computer.name}: #{computer.score}"
  end

  def display_winner
    if human_wins?
      puts "#{human.name} won! #{computer.name} lost!"
    elsif computer_wins?
      puts "#{human.name} lost! #{computer.name} won!"
    else
      puts "#{human.name} and #{computer.name} tied!"
    end
  end

  def grand_champion
    display_score
    puts "#{human.name} is grand champion!!" if human.score == MAX
    puts "#{computer.name} is grand champion, Sorry!" if computer.score == MAX
    puts "press (h) to display history. or (enter) for more details."
    ans = gets.chomp
    return unless ans == 'h'
    display_human_history
    display_computer_history
  end

  def play_again?
    human.score = 0
    computer.score = 0
    loop do
      puts "Want to play again?(y/n)"
      ans = gets.chomp
      return true if ans.downcase == 'y'
      return false if ans.downcase == 'n'
      puts "Invalid answer, try again."
    end
  end

  def gameloop # game interface
    loop do
      display_score
      human.choose
      computer.choose
      trace_and_display_moves
      display_winner
      next unless human.score == MAX || computer.score == MAX
      grand_champion
      break unless play_again?
    end
  end

  def play # game structure
    display_welcome_msg
    gameloop
    display_goodbye_msg
  end
end

RPSGame.new.play

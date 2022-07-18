=begin
  Rock Paper Scissors
  rock<paper<scissors<rock
  if players choose the same object its a tie.

  (Using classes and objects)
    -discription of problem
    -major nouns and verbs from description
    -organize and associate which verbs with which nouns
    -nouns are the classes and verbs are the behaviors (methods)

    After creating the needed classes, our job is to orchestrate the
    flow of the program using objects created from those classes.

  ----------------------------------------------------------

  Nouns: player, move, rule
  Verbs: choose, compare

  Player
    - choose
  Move
  Rule

    - compare

  ------------------------------------------------------------

  flow:
    the user makes a choice
      the pc makes a choice
        winner is displayed

        class Move
  def initialize
    # seems like we need something to keep track
    # of the choice... a move object can be "paper", "rock" or "scissors"
  end
end

class Rule
  def initialize
    # not sure what the "state" of a rule object should be
  end
end

# not sure where "compare" goes yet
def compare(move1, move2)

end

# rubocop:disable and # rubocop:enable

=end

module Clearable
  def clear_screen
    system 'clear'
  end
end

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
      clear_screen
      puts "Invalid, try again."
    end
    self.name = n
    clear_screen
  end

  def choose
    choice = nil
    loop do
      puts "Choose rock, paper, or scissors:"
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      clear_screen
      puts "Invalid, try again."
    end
    self.move = Move.new(choice)
    clear_screen
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

class RPSGame
  include Clearable
  attr_accessor :human, :computer

  MAX_WINS = 2

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_msg
    puts "Welcome to rock, paper, scissors!"\
         " Whoever gets to #{MAX_WINS} first, wins!"
  end

  def display_goodbye_msg
    puts "Thanks for playing! Goodbye!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
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
    if human.score == MAX_WINS
      puts "#{human.name} is the grand champion!!"
    else
      puts "#{computer.name} is the grand champion!! Sorry!"
    end
  end

  def play_again?
    human.score = 0
    computer.score = 0
    loop do
      puts "Want to play again?(y/n)"
      ans = gets.chomp
      return true if ans.downcase == 'y'
      return false if ans.downcase == 'n'
      clear_screen
      puts "Invalid answer, try again."
    end
  end

  def gameloop # game interface
    loop do
      display_score
      human.choose
      computer.choose
      display_moves
      display_winner
      next unless human.score == MAX_WINS || computer.score == MAX_WINS
      grand_champion
      break unless play_again?
      clear_screen
    end
  end

  def play # game structure
    display_welcome_msg
    gameloop
    clear_screen
    display_goodbye_msg
  end
end

RPSGame.new.play

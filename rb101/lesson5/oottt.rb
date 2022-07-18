# extras:
# Tracking scores with instance variable inside of Player class.

# Able to set name at the beginning, computer gets a random name.

# Able to set human marker to any value and set computer marker to a random
# letter a-z that is != to human's marker, or can choose default markers.

# Able to choose who goes first or pick random.

# Random computer name assignment.
# Human chooses name (must have a value).

# Computer attacks and defends, it will take center square
# if its available and there are no threats or winning oppurtunities.
# Otherwise it will take any open square when there are no
# threats and no winning opportunities and center square is taken.

class Board
  attr_accessor :squares

  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]

  def initialize
    @squares = {}
    reset
  end

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      return squares.first.marker if three_identical_markers?(squares)
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3

    markers.min == markers.max
  end
end

class Square
  INITIAL_MARKER = ' '

  attr_accessor :marker

  def marked?
    marker != INITIAL_MARKER
  end

  def initialize(marker = INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end
end

class Player
  COMPUTER_NAMES = %w(R2D2 Chappie Robocop Cortana C3P0 Sonny)

  attr_accessor :marker, :name, :score

  def initialize
    @score = 0
  end
end

class TTTGame
  MAX_WINS = 3

  attr_accessor :human, :computer
  attr_reader :board, :current_marker

  private

  def initialize
    @board = Board.new
    @human = Player.new
    @computer = Player.new
    @current_marker = nil
  end

  def display_welcome_message
    puts 'Welcome to tic tac toe! Get three in a row to win!'
    puts ''
  end

  def display_goodbye_message
    puts 'Thanks for playng tic tac toe. Goodbye!'
  end

  def display_board
    puts "#{human.name}'s marker: #{human.marker}. Wins: #{human.score}"
    puts "#{computer.name}'s marker: #{computer.marker}. Wins: "\
         "#{computer.score}"
    puts ""
    board.draw
    puts ""
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def joinor(arr, delimiter=', ', word='or')
    case arr.size
    when 0 then ''
    when 1 then arr.first
    when 2 then arr.join(" #{word} ")
    else
      arr[-1] = "#{word} #{arr.last}"
      arr.join(delimiter)
    end
  end

  def ask_who_goes_first
    ans = nil
    clear
    loop do
      puts "Who goes first? (h)uman, (c)omputer or (r)andom?"
      ans = gets.chomp
      break if %w(h c r).include?(ans)
      clear
      puts "Invalid. Try again."
    end
    ans
  end

  def set_who_goes_first
    ans = ask_who_goes_first
    case ans
    when "h" then human.marker
    when "c" then computer.marker
    when "r" then [human.marker, computer.marker].sample
    end
  end

  def ask_for_player_name
    ans = nil
    loop do
      puts "What's your name?"
      ans = gets.chomp.strip
      break unless ans == ' ' || ans.empty?
      clear
      puts 'Please enter a value.'
    end
    ans
  end

  def set_player_names
    clear
    ans = ask_for_player_name
    human.name = ans.strip
    computer.name = Player::COMPUTER_NAMES.sample
  end

  def ask_for_human_marker
    clear
    mark = nil
    loop do
      puts 'What do you want your marker to be? or (d)efault.'
      mark = gets.chomp.strip
      break unless mark == ' ' || mark.empty?
      clear
      puts 'Please enter a value.'
    end
    mark
  end

  def computer_marker_generator
    comp = nil
    loop do
      comp = ('a'..'z').to_a.sample
      break unless comp == human.marker
    end
    comp
  end

  def set_player_markers
    human.marker = ask_for_human_marker
    computer.marker = computer_marker_generator
    return unless human.marker == 'd'
    human.marker = 'X'
    computer.marker = 'O'
  end

  def setup_game
    set_player_names
    set_player_markers
    @current_marker = set_who_goes_first
  end

  def human_moves
    puts "Choose a square (#{joinor(board.unmarked_keys)})"
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts 'Sorry, invalid. Try again.'
    end

    board[square] = human.marker
  end

  def computer_check_middle_square
    board.squares.select do |k, v|
      k == 5 && v.marker == Square::INITIAL_MARKER
    end.keys.first
  end

  def computer_check_marker_count(line, mark)
    board.squares.select do |k, v|
      line.include?(k) && v.marker == mark
    end.keys.size
  end

  def middle_open
    sq = nil
    Board::WINNING_LINES.each do |_|
      sq = computer_check_middle_square
    end

    sq
  end

  def computer_check_for_urgent_move(mark)
    sq = nil
    Board::WINNING_LINES.each do |line|
      if computer_check_marker_count(line, mark) == 2
        sq = board.squares.select do |k, v|
          line.include?(k) && v.marker == Square::INITIAL_MARKER
        end.keys.first
      end
    end

    sq
  end

  def computer_attack_square
    computer_check_for_urgent_move(computer.marker)
  end

  def computer_defend_square
    computer_check_for_urgent_move(human.marker)
  end

  def assign_attack_square
    board[computer_attack_square] = computer.marker
  end

  def assign_defend_square
    board[computer_defend_square] = computer.marker
  end

  def assign_middle_square
    board[middle_open] = computer.marker
  end

  def assign_random_key
    board[board.unmarked_keys.sample] = computer.marker
  end

  def computer_moves
    if computer_attack_square
      assign_attack_square
    elsif computer_defend_square
      assign_defend_square
    elsif middle_open
      assign_middle_square
    else
      assign_random_key
    end
  end

  def track_score
    clear_screen_and_display_board
    case board.winning_marker
    when human.marker then human.score += 1
    when computer.marker then computer.score += 1
    end
  end

  def play_again?
    ans = ''
    loop do
      puts 'Play again? y/n'
      ans = gets.chomp.downcase
      break if %w(y n).include?(ans)
      puts 'Invalid, enter y or n.'
    end

    ans == 'y'
  end

  def clear
    system 'clear'
  end

  def reset_game
    board.reset
    clear
  end

  def reset_score
    human.score = 0
    computer.score = 0
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = computer.marker
    else
      computer_moves
      @current_marker = human.marker
    end
  end

  def human_turn?
    @current_marker == human.marker
  end

  def player_move
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
  end

  def someone_has_max_wins?
    return true if player_won? || computer_won?
  end

  def player_won?
    human.score == MAX_WINS
  end

  def computer_won?
    computer.score == MAX_WINS
  end

  def grand_champion
    clear_screen_and_display_board
    puts 'You are the grand champion!' if player_won?
    puts 'You are the grand loser!' if computer_won?
  end

  def main_game
    loop do
      reset_game
      display_board
      player_move
      track_score
      next unless someone_has_max_wins?
      grand_champion
      reset_score
      break unless play_again?
    end
  end

  public

  def play
    setup_game
    clear
    display_welcome_message
    main_game
    clear
    display_goodbye_message
  end
end

game = TTTGame.new
game.play

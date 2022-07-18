class Card
  SUITS = ['H', 'D', 'S', 'C']
  FACES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

  def initialize(suit, face)
    @suit = suit
    @face = face
  end

  def to_s
    "The #{face} of #{suit}"
  end

  def face
    case @face
    when 'J' then 'Jack'
    when 'Q' then 'Queen'
    when 'K' then 'King'
    when 'A' then 'Ace'
    else
      @face
    end
  end

  def suit
    case @suit
    when 'H' then 'Hearts'
    when 'D' then 'Diamonds'
    when 'S' then 'Spades'
    when 'C' then 'Clubs'
    end
  end

  def ace?
    face == 'Ace'
  end

  def king?
    face == 'King'
  end

  def queen?
    face == 'Queen'
  end

  def jack?
    face == 'Jack'
  end
end

class Deck
  attr_accessor :cards

  def initialize
    @cards = []
    Card::SUITS.each do |suit|
      Card::FACES.each do |face|
        @cards << Card.new(suit, face)
      end
    end

    scramble!
  end

  def scramble!
    cards.shuffle!
  end

  def deal_one
    cards.pop
  end
end

module Hand
  def show_hand
    puts "---- #{name}'s Hand ----"
    cards.each do |card|
      puts "=> #{card}"
    end
    puts "=> Total: #{total}"
    puts ""
  end

  def correct_for_aces(total)
    cards.select(&:ace?).count.times do
      break if total <= 21
      total -= 10
    end

    total
  end

  def state_of_card(card)
    if card.ace?
      11
    elsif card.jack? || card.queen? || card.king?
      10
    else
      card.face.to_i
    end
  end

  def total
    total = 0
    cards.each do |card|
      total += state_of_card(card)
    end

    correct_for_aces(total)
  end

  def add_card(new_card)
    cards << new_card
  end

  def busted?
    total > 21
  end
end

class Participant
  include Hand

  attr_accessor :name, :cards

  def initialize
    @cards = []
    set_name
  end
end

class Player < Participant
  def set_name
    name = ''
    loop do
      puts "What's your name?"
      name = gets.chomp
      break unless name.empty?
      puts "Sorry, must enter a value."
    end
    self.name = name
  end

  def show_flop
    show_hand
  end
end

class Dealer < Participant
  ROBOTS = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5']

  def set_name
    self.name = ROBOTS.sample
  end

  def show_flop
    puts "---- #{name}'s Hand ----"
    puts cards.first.to_s
    puts " ?? "
    puts ""
  end
end

class TwentyOne
  attr_accessor :deck, :player, :dealer

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def reset
    self.deck = Deck.new
    player.cards = []
    dealer.cards = []
  end

  def deal_cards
    2.times do
      player.add_card(deck.deal_one)
      dealer.add_card(deck.deal_one)
    end
  end

  def show_flop
    player.show_flop
    dealer.show_flop
  end

  def choose_hit_or_stay
    answer = nil

    loop do
      answer = gets.chomp.downcase
      break if ['h', 's'].include?(answer)
      puts "Sorry, must enter 'h' or 's'."
    end

    answer
  end

  def hit
    player.add_card(deck.deal_one)
    puts "#{player.name} hits!"
    player.show_hand
  end

  def end_of_player_turn?(answer)
    if answer == 's'
      puts "#{player.name} stays!"
      true
    elsif player.busted?
      true
    else
      hit
      player.busted?
    end
  end

  def player_turn_loop
    loop do
      puts "Would you like to (h)it or (s)tay?"
      answer = choose_hit_or_stay

      break if end_of_player_turn?(answer)
    end
  end

  def player_turn
    puts "#{player.name}'s turn..."
    player_turn_loop
  end

  def dealer_result
    if dealer.total >= 17 && !dealer.busted?
      puts "#{dealer.name} stays!"
    else
      puts "#{dealer.name} hits!"
      dealer.add_card(deck.deal_one)
    end
  end

  def dealer_choice
    dealer.show_hand
    dealer_result
    dealer.show_hand
  end

  def dealer_turn
    puts "#{dealer.name}'s turn..."

    loop do
      dealer_choice
      break if dealer.busted? || dealer.total >= 17
    end
  end

  def show_busted
    if player.busted?
      puts "It looks like #{player.name} busted! #{dealer.name} wins!"
    elsif dealer.busted?
      puts "It looks like #{dealer.name} busted! #{player.name} wins!"
    end
  end

  def show_cards
    player.show_hand
    dealer.show_hand
  end

  def show_result
    if player.total > dealer.total
      puts "It looks like #{player.name} wins!"
    elsif player.total < dealer.total
      puts "It looks like #{dealer.name} wins!"
    else
      puts "It's a tie!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if ['y', 'n'].include? answer
      puts "Sorry, must be y or n."
    end

    answer == 'y'
  end

  def begin_game
    system 'clear'
    reset
    deal_cards
    show_flop
  end

  def end_game_results
    show_cards
    show_result
  end

  def start
    loop do
      begin_game

      player_turn
      if player.busted?
        show_busted
        break unless play_again?
        next
      end

      dealer_turn
      if dealer.busted?
        show_busted
        break unless play_again?
        next
      end
      # both stayed
      end_game_results
      break unless play_again?
    end

    puts "Thank you for playing Twenty-One. Goodbye!"
  end
end

game = TwentyOne.new
game.start

=begin

Twenty-one is a card game consisting of a dealer and a player,
where the participants try to get as

Here is an overview of the game:
 - Both participants are initially dealt 2 cards from a 52-card deck.
 - The player takes the first turn, and can 'hit' or 'stay'.
 - If the player busts, he loses. If he stays. it's the dealer's turn.
 - The dealer must hit until his cards add up to at least 17.
 - If he busts, the player wins. If both player and dealer stays,
   then the highest total wins.
 - If both totals are equal, then it's a tie, and nobody wins.

Nouns: card, player, dealer, participant, deck, game,
       total (total is a property of some noun like calculate_total)
Verbs: deal, hit, stay, busts (busts here is a state not an action)

Participant <= super
Player < sub
 - hit
 - stay
 - busted?
 - total
Dealer < sub
 - hit
 - stay
 - busted?
 - total
 - deal ( here or maybe in Deck? )

Deck
 - deal (here, or in Dealer?)
Card
Game
 - start

=end

class Participant
  attr_accessor :cards
  attr_reader :name

  def initialize(name)
    @cards = { 'Spades' => [], 'Hearts' => [],
               'Diamonds' => [], 'Clubs' => [] }
    @name = name
  end

  def hit(deck)
    new_card = deck.deal
    cards[new_card[0]].push(new_card[1])
  end

  def busted?
    total > 21
  end

  def ace_check?(total)
    ((total + 11) < 22)
  end

  # rubocop:disable Style/ConditionalAssignment
  def add_ace_value(total, num_of_aces)
    if num_of_aces > 0
      if ace_check?(total + (num_of_aces - 1))
        total += 11 + (num_of_aces - 1)
      else
        total += num_of_aces
      end
    else
      total
    end

    total
  end
  # rubocop:enable Style/ConditionalAssignment

  def total
    total = 0
    num_of_aces = 0
    selected_cards = @cards.select { |_, card| !card.empty? }
    selected_cards.each_value do |cards|
      cards.each do |card|
        num_of_aces += 1 if card.type == 'Ace'
        total += card.value[card.type]
      end
    end
    add_ace_value(total, num_of_aces)
  end

  def reset
    @cards = { 'Spades' => [], 'Hearts' => [],
               'Diamonds' => [], 'Clubs' => [] }
  end
end

class Player < Participant; end

class Dealer < Participant; end

class Deck
  CARD_TYPES = ['2', '3', '4', '5', '6', '7', '8', '9',
                '10', 'Jack', "Queen", 'King', 'Ace']
  SUITMARKS = ['Spades', 'Hearts', 'Diamonds', 'Clubs']

  attr_accessor :cards

  def initialize
    # a hash where keys will be clubs/spades/hearts/diamonds
    # and values an array of all cards
    @cards = build_new_deck
  end

  def build_new_deck
    cards = Hash.new([])
    SUITMARKS.each do |mark|
      cards[mark] = []
      CARD_TYPES.each do |type|
        cards[mark].push(Card.new(type))
      end
    end
    cards
  end

  def deal
    suitmark = cards.keys.sample
    value = cards[suitmark].sample
    card = [suitmark, value]
    @cards[suitmark].delete(value)
    card
  end
end

class Card
  attr_reader :type

  def initialize(type)
    @type = type
  end

  def value
    { '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6,
      '7' => 7, '8' => 8, '9' => 9, '10' => 10, 'Jack' => 10,
      'Queen' => 10, 'King' => 10, 'Ace' => 0 }
  end
end

class Game
  attr_accessor :deck
  attr_reader :player, :dealer

  def initialize
    @deck = Deck.new
    @player = Player.new('Player')
    @dealer = Dealer.new('Dealer')
  end

  def start
    display_welcome_message
    loop do
      deal_initial_cards
      participant_turns

      display_result
      break if !play_again?
      reset
    end
    display_goodbye_message
  end

  def participant_turns
    player_turn
    dealer_turn if !@player.busted?
  end

  def play_again?
    answer = ''
    loop do
      puts ''
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if ['y', 'n'].include?(answer)
      clear
      puts "Sorry wrong input!"
    end
    answer == 'y'
  end

  def reset
    @deck = Deck.new
    @player.reset
    @dealer.reset
  end

  def display_welcome_message
    clear
    puts "Welcome! Lets play some Twenty One!"
    puts ""
    press_enter
  end

  def display_goodbye_message
    clear
    puts "Thank you for playing our game!"
    puts ''
    puts "See you next time!"
  end

  def display_cards(dealer_card = 'open')
    clear
    display_player_cards
    puts ""
    dealer_card == 'hidden' ? display_dealer_cards_hidden : display_dealer_cards
    puts ""
  end

  def display_player_cards
    puts "Player Cards:"
    @player.cards.each do |mark, cards|
      if !cards.empty?
        cards.each do |card|
          display_card(mark, card)
        end
      end
    end
    puts "Total value: #{player.total} points"
  end

  def display_dealer_cards
    puts "Dealer Cards:"
    @dealer.cards.each do |mark, cards|
      if !cards.empty?
        cards.each do |card|
          display_card(mark, card)
        end
      end
    end
    puts "Total value: #{dealer.total} points"
  end

  def display_dealer_cards_hidden
    puts "Dealer Cards:"
    selected_card = (@dealer.cards.select { |_, card| !card.empty? }).first
    mark = selected_card[0]
    card = selected_card[1][0]
    display_card(mark, card)
    puts "  Hidden Card"
  end

  def display_card(mark, card)
    puts "  #{card.type} of #{mark}"
  end

  def display_result
    display_cards
    if @player.busted? || @dealer.busted?
      display_busted
    elsif determine_winner == 'tie'
      puts "It is a tie!"
    elsif determine_winner == 'dealer'
      puts "#{@dealer.name} is the winner!"
    elsif determine_winner == 'player'
      puts "You are the winner!"
    end
  end

  def display_busted
    if @player.busted?
      puts "You have busted! The dealer wins this round."
    elsif @dealer.busted?
      puts "The dealer have busted! You win this round."
    end
  end

  def deal_initial_cards
    [@player.cards, @dealer.cards].each do |player|
      2.times do |_|
        card = @deck.deal
        player[card[0]].push(card[1])
      end
    end
  end

  def player_turn
    loop do
      display_cards('hidden')
      answer = select_hit_or_stay(['h', 's'])
      break if answer == 's' || @player.busted?
      @player.hit(@deck)
      break if @player.busted?
    end
  end

  def dealer_turn
    loop do
      dealer.total < 17 ? @dealer.hit(@deck) : break
    end
  end

  def select_hit_or_stay(choice)
    answer = ''
    loop do
      puts "Would you like to hit or stay? (h/s)"
      answer = gets.chomp.downcase
      break if choice.include?(answer)
      clear
      puts "Sorry invalid input!"
    end
    answer
  end

  def determine_winner
    return 'tie' if @player.total == @dealer.total
    @player.total > @dealer.total ? 'player' : 'dealer'
  end

  def press_enter
    loop do
      puts "Please press enter to continue..."
      answer = gets.chomp
      break if answer.empty?
    end
    clear
  end

  def clear
    system 'clear'
  end
end

game = Game.new
game.start

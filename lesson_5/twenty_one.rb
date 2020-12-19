# 1. Initialize our deck
# 2. Deal cards to player and dealer
# 3. Player turn: hit or stay
#     - repeat until bust or 'stay'
# 4. If player bust, dealer wins.
# 5. Dealer turn: hit or stay
#     - repeat until total >= 17
# 6. If dealer bust, player wins.
# 7. Compare cards and declare winner.
MAX_NUM = 21
MAX_DEALER_HIT = 17
NUMBER_OF_ROUNDS = 3

def prompt(str)
  puts "=> #{str}"
end

# various prompt messages
def initial_message
  system 'clear'
  prompt "We are about to play a game of #{MAX_NUM},
  which is a simplified version of blackjack."
  prompt "The first one to win #{NUMBER_OF_ROUNDS} rounds, wins this game."
  wait_and_clear
end

def player_turn_message(player_cards, dealer_cards, player_value)
  system 'clear'
  prompt "Dealer cards: "
  display_cards(dealer_cards, 1)
  prompt "You have: "
  display_cards(player_cards)
  prompt "Total value of your cards equals #{player_value}"
end

def round_end_status(status)
  system 'clear'
  if status == 'player_busted'
    prompt 'You have busted. The dealer wins this round.'
  elsif status == 'dealer_busted'
    prompt 'Dealer have busted. You win this round.'
  elsif status == 'player_wins'
    prompt 'You are the winner of this round'
  elsif status == 'dealer_wins'
    prompt 'Dealer is the winner of this round'
  else
    prompt "It's a tie. Nobody wins!"
  end
end

def round_end_info(player_cards, dealer_cards, player_value, dealer_value)
  prompt "The cards you had were: "
  display_cards(player_cards)
  prompt "Resulting in #{player_value} points"
  prompt "The cards dealer had were: "
  display_cards(dealer_cards)
  prompt "Resulting in #{dealer_value} points"
end

def round_end_count(player_count, dealer_count)
  prompt "The score: Player #{player_count} vs #{dealer_count} Dealer"
  wait_and_clear
end

def initialize_deck
  deck = {}
  suits = ['Hearts', 'Diamonds', 'Clubs', 'Spades']
  suits.each do |suit|
    deck[suit] = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']
  end
  deck
end

def initial_card_deals(deck)
  player_cards = {}
  dealer_cards = {}
  2.times do
    player_cards = assign_card!(deck, player_cards)
    dealer_cards = assign_card!(deck, dealer_cards)
  end
  return player_cards, dealer_cards
end

def assign_card!(deck, current_player)
  card = deal_card!(deck)
  if current_player.key?(card.keys[0])
    current_player[card.keys[0]] << card.values[0]
  else
    current_player[card.keys[0]] = card.values
  end
  current_player
end

def deal_card!(deck)
  suit = deck.keys.sample
  value = deck[suit].sample
  card = { suit => value }
  deck[suit].delete(value)
  card
end

def display_cards(cards, cards_amount = 'all')
  cards.each do |suit, values|
    if cards_amount == 1
      prompt "#{values[0]} of #{suit}"
      prompt "An unknown card"
      break
    else
      values.each { |value| prompt "#{value} of #{suit}" }
    end
  end
end

def players_turn(deck, player_cards, dealer_cards, player_value)
  loop do
    player_turn_message(player_cards, dealer_cards, player_value)

    answer = hit_or_stay
    if answer == 'hit'
      assign_card!(deck, player_cards)
    end
    player_value = calculate_value(player_cards)

    break if answer == 'stay' || busted?(player_value)
  end
  player_value
end

def dealers_turn(deck, dealer_cards, dealer_value)
  loop do
    break if dealer_value >= MAX_DEALER_HIT || busted?(dealer_value)
    dealer_cards = assign_card!(deck, dealer_cards)
    dealer_value = calculate_value(dealer_cards)
  end
  dealer_value
end

def hit_or_stay
  choice = ''
  loop do
    prompt "Would you like to hit or stay"
    choice = gets.chomp
    p choice
    if ['hit', 'stay'].include?(choice)
      break
    else
      prompt "Sorry. You can only choose to either 'hit' or 'stay'"
    end
  end
  choice
end

def calculate_value(cards)
  values_array = cards.values.flatten
  value = 0
  values_array.each do |variable|
    value += variable if variable.class == Integer
    value += 10 if ['Jack', 'Queen', 'King'].include?(variable)
  end
  if values_array.count('Ace') > 0
    value = calculate_ace(value, values_array.count('Ace'))
  end
  value
end

def calculate_ace(value, num_of_aces)
  num_of_aces.times do
    (value + 11) < (MAX_NUM + 1) ? value += 11 : value += 1
  end
  value
end

def busted?(value)
  value > MAX_NUM
end

def declare_winner(player_value, dealer_value)
  if player_value == dealer_value
    round_end_status('tie')
  elsif player_value > dealer_value
    round_end_status('player_wins')
  else
    round_end_status('dealer_wins')
  end
end

def wait_and_clear
  loop do
    prompt "press enter to continue"
    answer = gets.chomp
    break if answer.empty?
  end
  system 'clear'
end

def modify_count(p_value, d_value, p_count, d_count)
  if (p_value > d_value && p_value <= MAX_NUM) || busted?(d_value)
    p_count += 1
  elsif (p_value < d_value && d_value <= MAX_NUM) || busted?(p_value)
    d_count += 1
  end
  return p_count, d_count
end

def play_again?
  prompt "Would you like to play again? Enter 'yes' or 'no'"
  loop do
    answer = gets.chomp
    if answer.downcase == 'yes'
      return false
    elsif answer.downcase == 'no'
      return true
    else
      prompt "Sorry, you can only enter 'yes' or 'no'"
    end
  end
end

def display_winner(player_count)
  if player_count > 2
    prompt "You are the grand winner!"
  else
    prompt 'Dealer is the grand winner!'
  end
end
# main game
initial_message
loop do
  player_count = 0
  dealer_count = 0
  loop do
    break if player_count > 2 || dealer_count > 2

    deck = initialize_deck
    player_cards, dealer_cards = initial_card_deals(deck)
    player_value = calculate_value(player_cards)
    dealer_value = calculate_value(dealer_cards)

    player_value = players_turn(deck, player_cards, dealer_cards, player_value)
    if busted?(player_value)
      player_count, dealer_count = modify_count(player_value, dealer_value,
                                                player_count, dealer_count)
      round_end_status('player_busted')
      round_end_info(player_cards, dealer_cards, player_value, dealer_value)
      round_end_count(player_count, dealer_count)
      next
    end

    dealer_value = dealers_turn(deck, dealer_cards, dealer_value)
    if busted?(dealer_value)
      player_count, dealer_count = modify_count(player_value, dealer_value,
                                                player_count, dealer_count)
      round_end_status('dealer_busted')
      round_end_info(player_cards, dealer_cards, player_value, dealer_value)
      round_end_count(player_count, dealer_count)
      next
    end

    player_count, dealer_count = modify_count(player_value, dealer_value,
                                              player_count, dealer_count)
    declare_winner(player_value, dealer_value)
    round_end_info(player_cards, dealer_cards, player_value, dealer_value)
    round_end_count(player_count, dealer_count)
  end
  display_winner(player_count)
  break if play_again?
end

prompt "Thank you for playing"

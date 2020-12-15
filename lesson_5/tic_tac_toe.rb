WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
player_score = 0
COMPUTER_MARKER = 'O'
computer_score = 0

def prompt(msg)
  puts "=> #{msg}"
end

def display_welcome
  system 'clear'
  prompt "Welcome! You are about to play some Tic Tac Toe!!"
  prompt "The first player to get to 5 wins, gets to be the victorious one!!!"
  sleep 5
end

def display_board(brd, player_score, computer_score)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"
  puts "Your score is #{player_score}. Computers score is #{computer_score}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def choose_player
  system 'clear'
  prompt "Who is going to go first?"
  loop do
    prompt "Enter 'me' for player, 'you' for computer"
    choice = gets.chomp.downcase
    if choice == 'me'
      return 'player'
    elsif choice == 'you'
      return 'computer'
    else
      prompt 'Sorry, invalid choice. Try again!'
    end
  end
end

def alternate_player(current_player)
  current_player == 'player' ? 'computer' : 'player'
end

def current_score(player_score, computer_score)
  system 'clear'
  prompt "Current score: Player #{player_score} : #{computer_score} Computer"
  sleep 3
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def place_piece!(brd, current_player)
  if current_player == 'player'
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt joinor(empty_squares(brd))
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice"
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = nil

  # this is our offence
  WINNING_LINES.each do |line|
    square = computer_offence(brd, line)
    break if square
  end

  # this is our defense
  WINNING_LINES.each do |line|
    break if square
    square = computer_defense(brd, line)
  end

  if square.nil? && brd[5] == ' '
    square = 5
  elsif !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

def computer_offence(brd, line)
  if brd.values_at(line[0], line[1], line[2]).count(COMPUTER_MARKER) == 2
    if brd.values_at(line[0], line[1], line[2]).count(INITIAL_MARKER) == 1
      line.each do |num|
        return num if brd[num] == ' '
      end
    end
  end
  nil
end

def computer_defense(brd, line)
  if brd.values_at(line[0], line[1], line[2]).count(PLAYER_MARKER) == 2
    if brd.values_at(line[0], line[1], line[2]).count(INITIAL_MARKER) == 1
      line.each do |num|
        return num if brd[num] == ' '
      end
    end
  end
  nil
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd) # turn into boolean
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3 # splat operator
      return 'Player'
    elsif brd.values_at(line[0], line[1], line[2]).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def joinor(brd, delimiter = ', ', join_word = 'or')
  if brd.size > 1
    "Choose a square: #{brd[0..-2].join(delimiter)} #{join_word} #{brd[-1]}"
  else
    "Choose a square: #{brd.join}"
  end
end

display_welcome
loop do
  board = initialize_board
  current_player = choose_player

  loop do
    display_board(board, player_score, computer_score)

    place_piece!(board, current_player)
    current_player = alternate_player(current_player)

    break if someone_won?(board) || board_full?(board)
  end

  display_board(board, player_score, computer_score)

  if someone_won?(board)
    winner = detect_winner(board)
    winner == 'Player' ? player_score += 1 : computer_score += 1
    prompt "#{winner} won!"
  else
    prompt "It's a tie!"
  end
  sleep 2

  if player_score >= 5 || computer_score >= 5
    system 'clear'
    prompt "#{detect_winner(board)} is victorious!"
    prompt "Final score: Player #{player_score} : #{computer_score} Computer"
    break
  end

  current_score(player_score, computer_score)
end

prompt "Thanks for playing Tic Tac Toe! Good bye!"

# 1. Display the initial empty 3x3 board.
# 2. Ask the user to mark a square.
# 3. Computer marks a square
# 4. Display the updated board state
# 5. If winner, display winner
# 6. If board is full, display tie
# 7. If neither winner nor board is full, go to 2.
# 8. Play again?
# 9. If yes, go to 1.
# 10. Good bye!

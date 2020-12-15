=begin

Tic Tac Toe is a 2-player board game played on a 3x3 grid. Players take turns
marking a square. The first player to mark 3 squares in a row wins.

Nouns: board, player, square, grid
Verbs: play, mark

Board
Square
Player:
 - mark
 - play

=end

class Board
  attr_reader :squares

  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  def initialize
    @squares = {} # {1 => Square.new('R'), 2 => Square.new(' ')}
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

  # returns winning marker or nil
  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
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

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end
end

class Square
  INITIAL_MARKER = " "

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def marked?
    marker != INITIAL_MARKER
  end

  def unmarked?
    marker == INITIAL_MARKER
  end
end

class Player
  attr_accessor :score
  attr_reader :marker, :name

  def initialize(marker, name)
    @marker = marker
    @name = name
    @score = 0
  end
end

class TTTGame
  # HUMAN_MARKER = "X"
  # COMPUTER_MARKER = "O"
  WINNING_ROUNDS = 5

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = nil
    @computer = nil
    @current_marker = nil
    @game_type = nil
  end

  def play
    clear
    display_welcome_message
    choose_setup
    main_game
    display_goodbye_message
  end

  private

  def choose_setup
    display_setup_process
    choose_human_marker_and_name
    choose_computer_marker_and_name
    choose_game_type
    choose_who_starts
  end

  def main_game
    loop do
      display_board
      player_move
      display_result
      break if break_conditions
      reset
      display_play_again_message
    end
  end

  def choose_human_marker_and_name
    puts "To start with, pick you marker. It can be anything!"
    marker1 = gets.chomp
    puts "Enter your name:"
    name1 = gets.chomp
    @human = Player.new(marker1, name1)
    @human_name = human.name.capitalize
  end

  def choose_computer_marker_and_name
    puts "Next, pick computers marker:"
    marker2 = gets.chomp
    puts "Enter computers name:"
    name2 = gets.chomp
    @computer = Player.new(marker2, name2)
    @computer_name = computer.name.capitalize
    clear
  end

  def choose_game_type
    choice = nil
    loop do
      puts "Would you like to play random games or best of 5?"
      puts "Enter 1 for random, 2 for other"
      choice = gets.chomp
      break if ['1', '2'].include?(choice)
      clear
    end
    clear
    @game_type = choice == '1' ? 'random' : 'ranked'
  end

  def choose_who_starts
    choice = nil
    loop do
      puts "Who should go first? You or computer?"
      puts "Enter 1 for you to go first, 2 for computer"
      choice = gets.chomp
      break if ['1', '2'].include?(choice)
      clear
    end

    clear
    @current_marker = choice == '1' ? human.marker : computer.marker
  end

  def break_conditions
    if @game_type == 'random'
      play_again?
    else
      human.score >= WINNING_ROUNDS || computer.score >= WINNING_ROUNDS
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry, must be y or n"
    end

    answer == 'n'
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

  def display_setup_process
    puts "At the start we need to follow some setup steps."
    puts ""
    puts "We will choose a name and a marker for both players;"
    puts "Next we will determine the type of our game;"
    puts "And finally we will choose who should start first!"
    puts ""
  end

  def display_play_again_message
    if @game_type == 'random'
      puts "Let's play again!"
    else
      puts "#{@human_name} score: #{human.score} " \
      "#{@computer_name} score: #{computer.score}"
    end
    puts ""
  end

  def display_goodbye_message
    puts "Final score => #{@human_name} #{human.score} " \
         ": #{@computer_name} #{computer.score}"
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def display_board
    puts "You're a #{human.marker}. #{@computer_name} is a #{computer.marker}"
    puts ""
    board.draw
    puts ""
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def display_result
    clear_screen_and_display_board

    if board.winning_marker == human.marker
      human.score += 1
      puts "#{@human_name} won!"
    elsif board.winning_marker == computer.marker
      computer.score += 1
      puts "#{@computer_name} won!"
    else
      puts "It's a tie!"
    end
  end

  def display_selection(selection)
    if selection.size > 1
      puts "Choose a square: #{selection[0..-2].join(', ')} or #{selection[-1]}"
    else
      puts "Choose a square: #{selection.join}"
    end
  end

  def player_move
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
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

  def human_moves
    display_selection(board.unmarked_keys)
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end

    board[square] = human.marker
  end

  def computer_moves
    square = nil

    square = computer_tactics(square)

    if board.squares[5].marker == Square::INITIAL_MARKER && square.nil?
      square = 5
    elsif square.nil?
      square = board.unmarked_keys.sample
    end

    board[square] = computer.marker
  end

  def computer_tactics(square)
    # offensive AI
    Board::WINNING_LINES.each do |line|
      square = computer_offence(line)
      break if square
    end

    # defensive AI
    Board::WINNING_LINES.each do |line|
      break if square
      square = computer_defense(line)
    end
    square
  end

  def computer_offence(line)
    markers = board.squares.values_at(*line).collect(&:marker)
    if markers.count(computer.marker) == 2
      if markers.count(Square::INITIAL_MARKER) == 1
        line.each do |n|
          return n if board.squares[n].marker == Square::INITIAL_MARKER
        end
      end
    end
    nil
  end

  def computer_defense(line)
    markers = board.squares.values_at(*line).collect(&:marker)
    if markers.count(human.marker) == 2
      if markers.count(Square::INITIAL_MARKER) == 1
        line.each do |n|
          return n if board.squares[n].marker == Square::INITIAL_MARKER
        end
      end
    end
    nil
  end

  def human_turn?
    @current_marker == human.marker
  end

  def clear
    system 'clear'
  end

  def reset
    board.reset
    choose_who_starts
    clear
  end
end

# we'll kick off the game like this
game = TTTGame.new
game.play

=begin
Problem:
- Rock, Paper, Scissors is a two-player game where each player chooses
  one of three possible moves: rock, paper or scissors. The chosen moves
  will then be compared to see who wins, according to the following rules:

  rock beats scissors
  scissors beats paper
  paper beats rock

  If the players chose the same move, then it's a tie.
- So, Nouns: player, move, rule
  Verbs: choose, compare
- Player
  - choose
  Move
  Rule

  - compare
=end

# Game Orchestration Engine
class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors, Spock, Lizad!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors, Spock, Lizard. Good bye!"
    puts "Final score: #{human.score} vs #{computer.score}"
    puts "Your moves history: #{human.history}"
    puts "Computer moves history: #{computer.history}"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"
  end

  def display_winner
    if human.move > computer.move
      update_history_score('human', human.move, computer.move)
      puts "#{human.name} won!"
    elsif computer.move > human.move
      update_history_score('comp', human.move, computer.move)
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end

  def update_history_score(winner, move1, move2)
    winner == 'human' ? human.score += 1 : computer.score += 1
    human.history << move1.value
    computer.history << move2.value
  end

  def display_score
    puts "Your score is: #{human.score}"
    puts "Computers score is: #{computer.score}"
  end

  def choose_game
    answer = ''
    loop do
      puts "Would you like to play best of 5 or just random rounds?"
      puts "Enter 'a' for the first choice, 'b' for the second choice."
      answer = gets.chomp
      break if ['a', 'b'].include?(answer)
    end
    answer
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
      puts "Sorry, must be y or n."
    end

    return true if answer == 'y'
    false
  end

  def play
    display_welcome_message
    game_type = choose_game
    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      display_score
      if game_type == 'b'
        break unless play_again? 
      else
        break if human.score == 5 || computer.score == 5
      end
    end
    display_goodbye_message
  end
end

class Player
  attr_accessor :move, :name, :score, :history

  def initialize
    @score = 0
    @history = []
    set_name()
  end
end

class Human < Player
  def set_name
    n = ""
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, scissors, spock or lizard:"
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', "Sonny", 'Number 5'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class Move
  attr_accessor :value

  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']
  RULES = { 'rock' => ['scissors', 'lizard'], 'paper' => ['rock', 'spock'],
            'scissors' => ['paper', 'lizard'], 'lizard' => ['spock', 'paper'],
            'spock' => ['rock', 'scissors'] }

  def initialize(value)
    @rock = Rock.new.value
    @paper = Paper.new.value
    @scissors = Scissors.new.value
    @lizard = Lizard.new.value
    @spock = Spock.new.value
    @value = select_value(value)
  end

  def select_value(choice)
    case choice
    when 'rock'
      @rock
    when 'paper'
      @paper
    when 'scissors'
      @scissors
    when 'lizard'
      @lizard
    when 'spock'
      @spock
    end
  end

  def >(other_move)
    RULES[@value].include?(other_move.value)
  end

  def to_s
    @value
  end
end

class Rock
  attr_accessor :value

  def initialize
    @value = 'rock'
  end
end

class Paper
  attr_accessor :value

  def initialize
    @value = 'paper'
  end
end

class Scissors
  attr_accessor :value

  def initialize
    @value = 'scissors'
  end
end

class Lizard
  attr_accessor :value

  def initialize
    @value = 'lizard'
  end
end

class Spock
  attr_accessor :value

  def initialize
    @value = 'spock'
  end
end

RPSGame.new.play

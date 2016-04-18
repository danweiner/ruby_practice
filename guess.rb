# Guessing game in which hints might not be true

class Game
  # Game class code goes here
  TOTAL_ROUNDS = 3

  def initialize(player)
    @player = player
    @round = 0
    next_round
  end

  def next_round
    @computers_number = 0
    @round_done = false
    @round += 1
    @player.prepare_for_new_round
  end

  def round
    @round
  end

  def done?
    @round > TOTAL_ROUNDS
  end

  def round_done?
    @round_done
  end

  # Get high number from player to start the game
  # Number must be higher than 1
  def get_high_number
    print "I'll pick a number between 1 and what number? "
    high_number = @player.get_high_number
    if high_number == 1
      puts "Oops! The number must be larger than 1.  Try again."
      return false
    else
      return true
    end
  end

  def get_guess_count
    average = calculate_typical_number_of_guesses
    puts "How many guesses do you think it will take?"
    print "(average would be #{average}): "
    total_guess_count = @player.get_total_guess_count
    if total_guess_count <= 1
      puts "Seriously #{@player.name}? You need to at least try!"
      return false
    else
      return true
    end
  end

  def calculate_typical_number_of_guesses
    typical_count = Math.sqrt(@player.high_number)
    typical_count.round
  end

  def prepare_computer_number
    @computers_number = rand(@player.high_number) + 1
  end

  def get_player_guess
    print "#{@player.name}, what is your guess? "
    @player.get_guess
    compare_player_guess_to_computer_guess
  end

  def compare_player_guess_to_computer_guess
    if @player.current_guess == @computers_number
      @round_done = true
      puts "YEAH!!! You guessed it!"
      calculate_score
    else
      show_hint
    end
  end

  # Shows whether the player's guess is high or low
  # Sometimes does not display the correct hint depending on tell_truth
  def show_hint
    hints = ["low", "high"]
    if @player.current_guess < @computers_number
      hint_index = 0
    else
      hint_index = 1
    end
    if !tell_truth?
      hint_index = hint_index - 1
      hint_index = hint_index.abs
    end
    puts "HINT: You are too #{hints[hint_index]}"
  end

  # If the number is greater than equal to 4
  # The condition is true and the hint will "tell the truth"
  def tell_truth?
    rand(100) >= 4
  end

  def calculate_score
    score = 0
    if @player.guess_count > @player.total_guess_count
      score = 1
    elsif @player.total_guess_count < calculate_typical_number_of_guesses
      score = 3
    else
      score = 5
    end
    @player.add_score(score)   
  end

  def show_results
    puts "Guess count: ##{@player.guess_count}"
    puts "Target: #{@player.total_guess_count}"
  end

  def print_final_score 
    puts "You took #{@player.total_guess_count} total guesses"
    puts "Final score for #{@player.name} is #{@player.score}"
  end

  def quit_game
    actions = ["q - quit"]
    puts "If you would like to leave the game, press #{actions}"
    if ( @player.quit == "q" )
      puts "Goodbye, thank you for playing"
      @round > TOTAL_ROUNDS
    end
  end

end

class Player
  # Player class code goes here
  def initialize(name)
    @name   = name
    @score  = 0
    @player_action = ""
    prepare_for_new_round
  end

  def prepare_for_new_round
    @total_guess_count          = 0
    @high_number                = 0
    @current_guess              = 0
    @total_number_of_guesses    = 0
    @current_number_of_guesses  = 0
  end

  def name
    @name
  end

  def score
    @score
  end

  def player_action
    @player_action
  end

  def total_guess_count
    @total_guess_count
  end

  def high_number
    @high_number
  end

  def current_guess
    @current_guess
  end

  def guess_count
    @current_number_of_guesses
  end

  def total_guess_count
    @total_number_of_guesses
  end

  def add_score(points)
    @score += points
  end

  def get_high_number
    @high_number = gets.to_i
  end

  def get_total_guess_count
    @total_number_of_guesses += 1
    @total_guess_count = gets.to_i
  end

  def get_guess
    @current_number_of_guesses += 1
    @current_guess = gets.to_i
  end

  def quit
    @player_action = gets.chomp
  end
end

puts "Welcome to the Guessing Game"
puts "We will play #{Game::TOTAL_ROUNDS} rounds.  Try to guess the number"
puts "I'm thinking of in the fewest guesses."
puts "You'll also estimate how many guesses it will take."
puts "If you do it in fewer guesses, you'll gain bonus points!"
puts ""

print "What is your name? "
name = gets.chomp
player = Player.new(name)
game = Game.new(player)


while !game.done? do
  puts ""
  puts "------> round ##{game.round}"
  puts ""

  
  if game.get_high_number
    if game.get_guess_count
      game.prepare_computer_number
      while !game.round_done? do
        puts ""
        game.get_player_guess
        game.show_results
      end
      game.next_round
      game.quit_game
    end
  end
end

puts ""
game.print_final_score

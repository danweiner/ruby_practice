# Elimination-round, tournament-style, avoid the shortest straw game


# straw class will keep track of the size of the straw
# it will be able to tell if it's the "short straw"
# it will also be able to draw itself
class Straw

  # These represent the two sizes of straws
  SHORT_STRAW = 5
  LONG_STRAW = 20

  def initialize(size)
    @straw_size = size
  end

  # straw getter methods

  # tests whether the straw is short, returns a boolean
  def short?
    @straw_size == SHORT_STRAW
  end

  # return a string that represents what the straw looks like
  def appearance 
    '=' * @straw_size 
  end

  # this is a factory method that will create an array of Straw objects
  # 'Self' tells Ruby that this is a class method
  # class methods are used to send messages when an object doesnt exist
  # you are sending a message to the class itself
  def self.create_bundle(short, long)
    bundle = []

    1.upto(short) do
      bundle << Straw.new(SHORT_STRAW)
    end

    1.upto(long) do
      bundle << Straw.new(LONG_STRAW)
    end
    bundle
  end
end

class Player
  # getter method
  attr_reader :name

  # shorthand for getter and setter method
  attr_accessor :straw

  def initialize(name)
    @name = name
  end

  # player helper methods
  def appearance
    "#{straw.appearance} #{name}"
  end

  # to see if a player is holding the short straw
  def short_straw?
    straw.short?
  end
end

class Game

  # generate a set of player objects using the supplied name array
  def initialize(player_names)
    @players = []
    player_names.each do |name|
      @players.push(Player.new(name))
    end
    @rounds = 1
  end

  def done?
    @players.length <= 1
  end

  def show_round_number  
    puts "" 
    puts "----> Round #{@rounds}" 
    puts ""
  end

  # prepares the straws for the round and passes them out to the players
  def play_round
    bundle_of_straws = setup_new_bundle
    0.upto(@players.length - 1) do |index|
      player = @players[index]
      player.straw = bundle_of_straws.pop
    end
  end

  def setup_new_bundle
    number_of_players = @players.length
    # using the factory method from Straw class to create an array of Straw objects
    bundle = Straw.create_bundle(1, number_of_players - 1)
    bundle.shuffle
  end

  # using the player class' ability to generate an appearance for the player
  def show_results
    @players.each do |player|
      puts player.appearance
    end
  end

  def finish_round 
    @players.delete_if do |player|
      player.short_straw?
    end
    @rounds += 1
  end

  # the winner of the game is represented by the last object in the @players array
  def show_winner 
    last_player = @players.first
    puts ""
    puts "The winner is #{last_player.name}"
    puts ""
  end
  # the rest of the game class code will go here
end

puts "Welcome to the Last Straw Game"
puts "In each round, players will draw straws of two different lengths"
puts "The players who pick the short straw will be eliminated and"
puts "a new round will begin"
puts "Please enter player names (4 players)"

PLAYERS = %w(anne bert chris donna ernie frank garfield holden ivy jose)
print "Player 1: "
player1 = gets.chomp
print "Player 2: "
player2 = gets.chomp
print "Player 3: "
player3 = gets.chomp
print "Player 4: "
player4 = gets.chomp

game_players = [player1, player2, player3, player4]
game = Game.new(game_players)

# top-down programming - write the main game loop as if these methods already exist
while !game.done? do 
  game.show_round_number
  game.play_round
  game.show_results
  game.finish_round
end

game.show_winner
# Acey Deucy
# A multiplayer card game where you try to guess whether the
# next card will be between the two other cards, placing bets on the results

require_relative "game"
require_relative "deck"
require_relative "card"
require_relative "player"

STARTING_NUMBER_OF_CHIPS  = 10
MINIMUM_PLAYERS           = 2

puts "Welcome to Acey Deucy"
print "Enter number of players: "
player_count = gets
player_count = player_count.to_i

# confirm that the minimum number of players has been requested
# prepare an array to hold the player objects
if player_count >= MINIMUM_PLAYERS
  # Load up some players
  players = []
  # Add code to create players here
  (0..player_count).each do |index|
    print "Enter name for player ##{index + 1}: "
    name = gets
    name = name.chomp
    players << Player.new(name, STARTING_NUMBER_OF_CHIPS)
  end
  # Create a game object from the Game class and pass in players array
  game_engine = Game.new(players)
  # Display the starting set of players
  game_engine.show_player_chips
  # Launch the game
  game_engine.play
else
  puts "There should be at least #{MINIMUM_PLAYERS}"
end
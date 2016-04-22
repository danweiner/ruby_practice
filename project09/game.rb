class Game
  attr_reader :players, :deck, :bank, :round
  ANTE_AMOUNT = 1

  def initialize(players)
    # Players array is passed in to the Game object from acey.rb
    @players = players
    @deck = Deck.new(Card.create_cards)
    @deck.shuffle
    @bank = 0
    @round = 0
  end

  # Determine if there are any active players remaining
  def remaining_players
    players.count {|player| !player.eliminated?}
  end

  def play
    while deck.size > (players.length * 3) && remaining_players > 1 do
      new_round
      puts "-" * 40
      puts "Round #{round}!  The dealer has #{bank} chips."
      puts "-" * 40
      puts "Everyone antes"
      ante
      puts "The dealer now has #{bank} chips."
      deal_cards(2)
      sort_cards
      puts "---> Current cards:\n"
      show_cards
      puts "---> Players bet: \n"
      players_bet
      puts "\n---> Dealer deals one more card\n"
      deal_cards(1)
      show_cards
      puts "---> Determining results\n"
      determine_results
      puts "\n---> New standings\n"
      show_player_chips
      puts ""
    end
    game_over
  end

  # At the start of each round the game updates its counter and players discard their hands
  def new_round
    @round += 1
    players.each do |player|
      player.discard_hand
    end
  end

  # Each player contributes a chip to the bank as ante
  def ante
    players.each do |player|
      unless player.eliminated?
        @bank = @bank + player.pay(ANTE_AMOUNT)
      end
    end
  end

  # Dealer needs to give each player his or her cards
  def deal_cards(num_of_cards)
    players.each do |player|
      # Skip to the next iteration of the loop if the player is eliminated
      next if player.eliminated?
      # This allows any number of cards to be given to the player - makes the method flexible
      1.upto(num_of_cards) do
        player.take_card(deck.deal)
      end
    end
  end

  # Sort cards 
  def sort_cards
    players.each do |player|
      next if player.eliminated?
      player.sort_hand_by_rank
    end
  end

  # Ask players to bet on his/her hand
  def players_bet
    players.each do |player|
      if player.eliminated?
        puts "#{player.name} passes. (Out of chips!)"
      else
        print "#{player.name} can bet between 0 and #{max_bet(player)}: "
        bet = gets.to_i
        if bet < 0 || bet > max_bet(player)
          bet = 0
        end
        puts "#{player.name} bet #{bet}"
        player.bet = bet
      end
    end
  end

  # Helper method to determine max bet allowed by the player
  def max_bet(player)
    [player.chips, bank].min
  end

  # Show the player's current chip amounts
  def show_player_chips
    players.each do |player|
      if player.eliminated? 
        puts "#{player.name} has been eliminated"
      else
        puts "#{player.name} has #{player.chips} chips"
      end
    end
  end

  # Review the players' cards
  def show_cards
    players.each do |player|
      puts "Player #{player.name}"
      if player.eliminated?
        puts "Has been eliminated!"
      else
        player.hand.each do |card|
          puts card.to_s
        end
      end
      puts ""
    end
  end

  def determine_results
    players.each do |player|
      if not player.eliminated?
        # first 2 cards already sorted
        low_card = player.hand[0]
        high_card = player.hand [1]
        # last card in the hand array is the third card
        # this should be in the middle of the other two in order to win
        middle_card = player.hand[2]
        # Write conditions to check each game rule
        if Card.compare_rank(low_card, middle_card) == 0 || Card.compare_rank(high_card, middle_card) == 0
          puts "#{player.name} got an exact match, loses twice the bet!"
          chips = player.pay(player.bet * 2)
        elsif Card.compare_rank(middle_card, low_card) < 0 || Card.compare_rank(middle_card, high_card) > 0
          puts "#{player.name} wasn't in between and loses the bet!"
          chips = player.pay(player.bet)
        else
          puts "#{player.name} wins bet!"
          chips = -player.bet
          player.win(player.bet)
        end
        @bank = @bank + chips
        if @bank <= 0
          puts "Dealer is out of chips, everyone needs to ante up!"
        end
        while @bank <= 0
          ante
        end
      end 
    end
  end

  def game_over
    puts "Game Over!"
    players.sort! do |player1, player2|
      # Sort players by their chip count, lowest to highest
      player1.chips <=> player2.chips
    end
    puts "The winner is #{players.last.name}"
  end
end
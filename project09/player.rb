# Player must have a name
# Player must have cards
# Player must have chips to bet with 
# Player must have a current bet number

class Player
  attr_accessor :name, :hand, :chips, :bet

  def initialize(name, chips)
    @name = name
    @hand = []
    @chips = chips
    @bet = nil
  end

  # Discard hold hand and prepare for next round
  def discard_hand
    @bet = nil
    @hand = []
  end

  # Player adds next card to hand
  def take_card(card)
    @hand << card
  end

  # Player can sort cards from low to high
  def sort_hand_by_rank
    @hand.sort! do |card1, card2|
      Card.compare_rank(card1, card2)
    end
  end

  # Player is eliminated if no chips left
  def eliminated?
    @chips <= 0
  end

  # Player must pay if she loses a bet
  def pay(amount)
    if amount > @chips
      pay = @chips 
      @chips = 0 
    else 
      pay = amount 
      @chips -= amount 
    end 
    pay
  end

  # If a player wins, send the winnings to the player's pile
  def win(amount)
    @chips += amount
  end
end
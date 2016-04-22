class Card
  SUITS = %w(Clubs Diamonds Hearts Spades)
  RANKS = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)

  attr_accessor :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  # this is using the accessors for the variables, instead of @ symbol
  def to_s
    "#{rank} of #{suit}"
  end

  # returns -1 if card1 is less than, 0 is same, and 1 if larger than card2
  def self.compare_rank(card1, card2)
    # Use index method to compare a card's position in the RANKS array
    RANKS.index(card1.rank) <=> RANKS.index(card2.rank)
  end

  # Use a factory method to create a collection of 52 cards that can be used as a deck
  def self.create_cards
    cards = []
    SUITS.each do |suit|
      RANKS.each do |rank|
        cards << Card.new(rank, suit)
      end
    end
  end
end
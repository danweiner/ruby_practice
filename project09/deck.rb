# Creates a new deck but doesnt really know about behavior of deck of cards
class Deck

  def initialize(cards)
    @cards = cards
  end

  def shuffle
    # Because @cards holds an array object, you can use Ruby's build in array methods
    unless @cards.empty?
      @cards.shuffle!
    end
  end

  def deal
    unless @cards.empty?
      @cards.pop
    end
  end

  def size
    @cards.length
  end

end
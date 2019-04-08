class Deck

  SUIT = %w{♠ ♥ ♣ ♦}
  RANK = %w{2 3 4 5 6 7 8 9 10 J Q K A}

  def initialize
    @deck = []
    cards
    @deck.shuffle!
  end

  def cards
    RANK.each do |value|
      SUIT.each { |suit| @deck << Card.new(value, suit) }
    end
  end

  def add_card
    @deck.pop
  end

end

class Participant
  attr_accessor :name, :cards, :cards_sum

  def initialize(name = 'Jack')
    @name = name
    @cards = []
  end

  def take_card(card)
    @cards << card
  end

  def sum_of_cards
    @cards_sum = 0
    @cards.each { |card| @cards_sum += card.value }
    @cards.select { |card| card.rank =~ /A/ }.each { @cards_sum -= 10 if @cards_sum > 21 }
  end

  def refresh
    @cards = []
    @sum_of_cards = 0
  end
  
end

class Card

  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def value
    return @rank.to_i if @rank =~ /\d/
    return 10 if @rank =~ /[JQK]/
    11 if @rank =~ /[A]/
  end

end

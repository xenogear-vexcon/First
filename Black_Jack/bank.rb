class Bank
  attr_accessor :money

  BET = 10
  PRIZE = 20

  def initialize
    @money = 100
  end

  def take_prize
    @money += PRIZE
  end

  def make_bet
    @money -= BET
  end

  def take_bet
    @money += BET
  end
  
end

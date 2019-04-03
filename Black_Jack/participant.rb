class Participant
  attr_accessor :name, :money, :cards

  def initialize(name = 'Jack')
    @name = name
    @money = 100
    @cards = {}
  end
  
end

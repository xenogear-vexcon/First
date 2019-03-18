class PassengerTrain < Train

  validate :number, :presence
  validate :number, :format, TRAIN_NUMBER
  
  def initialize(number)
    super(number, 'passenger')
  end
end

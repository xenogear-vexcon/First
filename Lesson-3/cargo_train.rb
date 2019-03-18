class CargoTrain < Train
  validate :number, :presence
  validate :number, :format, TRAIN_NUMBER

  def initialize(number)
    super(number, 'cargo')
  end
end

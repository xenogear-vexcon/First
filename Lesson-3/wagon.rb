class Wagon
  include Validation
  include InstanceCounter
  include Manufacturing
  attr_reader :type, :number

  WAGON_NUMBER = /^[0-9]{3}$/.freeze

  def initialize(number, type)
    # cargo or passenger type
    @number = number
    @type = type
    validate!
  end

  protected

  def validate!
    raise 'Введен некорректный номер, должно быть 3 цифры!' if @number !~ WAGON_NUMBER
    raise 'Введен некорректный тип вагона!' unless %w[cargo passenger].include?(@type)
  end
end

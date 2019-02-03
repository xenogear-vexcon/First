require_relative 'instance_counter'
require_relative 'manufacturing_company'

class Wagon
  include InstanceCounter
  include Manufacturing

  WAGON_NUMBER = /^[0-9]{3}$/

  def initialize(number, type)
    #cargo or passenger type
    @number = number
    @type = type
    validate!
  end

  def validate?
    validate!
    true
  rescue
    false
  end

  protected

  def validate!
    raise 'Введен некорректный номер, должно быть 3 цифры!' if @number !~ WAGON_NUMBER
    raise 'Введен некорректный тип вагона!' if @type != ('cargo' || 'passenger')
  end
end

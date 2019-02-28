class PassengerWagon < Wagon
  attr_reader :free_seats, :taken_seats
  MAX_SEATS = 50

  def initialize (number, type = 'passenger', seats = MAX_SEATS)
    @number = number
    @type = type
    @free_seats = seats
    @taken_seats = 0
  end

  def vacant
    check_vacant_seats!
    @free_seats -= 1
    @taken_seats += 1
  end

  def vacant_seats
    @taken_seats
  end

  def free_seats
    @free_seats
  end

  private

  def check_vacant_seats!
    raise 'Свободных мест нет!' if @free_seats == 0
  end
end

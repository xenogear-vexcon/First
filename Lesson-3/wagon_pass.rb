class PassWagon < Wagon
  attr_reader :free_seats, :taken_seats
  MAX_SEATS = 50

  def initialize (seats = MAX_SEATS)
    super('passenger')
    @free_seats = seats
    @taken_seats = 0
  end

  def vacant
    check_vacant_seats!
    @free_seats -= 1
    @taken_seats += 1
  end

  private

  def check_vacant_seats!
    raise 'Свободных мест нет!' if @free_seats == 0
  end
end

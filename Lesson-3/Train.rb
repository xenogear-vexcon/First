class Train
  attr_reader :number, :type
  attr_accessor :wagon_quantity, :speed, :route

  @@all_trains = []

  def initialize(number, type, wagon_quantity = 1)
    #cargo or passenger
    @number = number
    @type = type
    @wagon_quantity = wagon_quantity
    @speed = 0
    @@all_trains << self
    @station_index = 0
  end

  def increase_speed(speed)
    self.speed = speed
  end

  def stop
    self.speed = 0
  end

  def add_wagon
    if stop
      self.wagon_quantity += 1
    else
      raise 'Train is on the way'
    end
  end

  def remove_wagon
    if stop
      self.wagon_quantity -= 1 
    else
      raise 'Train is on the way'
    end
  end

  def add_route(route)
    @route = route
    @route.stations.first.train_to_station(self)
  end

  def moving_forward
    return unless next_station

    current_station.train_from_station(self)
    @station_index += 1
    current_station.train_to_station(self)
  end

  def moving_backward
    current_station.train_from_station(self)
    @station_index -= 1
    current_station.train_to_station(self)
  end

  def current_station
    @route.stations[@station_index]
  end

  def next_station
    return if @route.nil?
    
    @route.stations[@station_index + 1]
  end

  def previous_station
    @route.stations[@station_index - 1]
  end

end

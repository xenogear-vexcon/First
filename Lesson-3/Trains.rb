class Station
  attr_reader :station_name, :list_of_trains

  @@stations = []

  def initialize(station_name)
    @station_name = station_name
    @@stations << self
    @list_of_trains =[]
  end

  def train_to_station(train)
    @list_of_trains << train
  end

  def all_trains
    @list_of_trains.each { |train| puts train }
  end

  def train_type(type)
    trains_by_type = @list_of_trains.select { |train| train.type == type }
    trains_by_type.each { |train| puts train.number }
  end

  def train_from_station(train)
    @list_of_trains.delete(train)
  end
end


class Route
  attr_accessor :stations

  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def delete_station(station)
    @stations.delete(station)
  end
end


class Train
  attr_reader :number, :type
  attr_accessor :quantity, :speed, :route

  @@all_trains = []

  def initialize(number, type, quantity = 1)
    #cargo or passenger
    @number = number
    @type = type
    @quantity = quantity
    @speed = 0
    @@all_trains << self
    @station_index = 0
    @route = nil
  end

  def increase_speed(speed)
    self.speed = speed
  end

  def stop
    self.speed = 0
  end

  def add_wagon
    if stop
      self.quantity += 1
    else
      raise 'Train is on the way'
    end
  end

  def remove_wagon
    if stop
      self.quantity -= 1 
    else
      raise 'Train is on the way'
    end
  end

  def add_route(route)
    @route = route
    @route.stations[0].train_to_station(self)
  end

  def moving_forward
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
    @route.stations[@station_index + 1]
  end

  def previous_station
    @route.stations[@station_index - 1]
  end

end

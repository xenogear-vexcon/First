
# require_relative 'instance_counter'
# require_relative 'manufacturing_company'

class Train
  include InstanceCounter
  include Manufacturing
  attr_reader :number, :type, :wagons, :route, :speed
  attr_accessor :wagon_quantity

  @@all_trains = {}

  def self.find(number)
    if @@all_trains.keys.include?(number)
      p "Поезд с номером #{number} имеет тип #{@@all_trains[number]}"
    else
      nil
    end
  end

  def self.all
    @@all_trains.each do |x, y|
      puts "Поезд номер #{x} имеет тип #{y}"
    end
  end

  def initialize(number, type)
    #cargo or passenger
    @number = number
    @type = type
    @speed = 0
    @@all_trains.store(number, type)
    register_instance
    @station_index = 0
    @wagons = []
  end

  def increase_speed(speed)
    @speed = speed
  end

  def stop
    @speed = 0
  end

  def add_wagon(wagon)
    valid_wagon!(wagon)
    if stop
      @wagons << wagon
    else
      raise 'Train is on the way'
    end
  end

  def remove_wagon(wagon)
    if stop
      @wagon.delete(wagon)
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
    return unless previous_station
    
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
    return if @route.nil?
    
    @route.stations[@station_index - 1]
  end

  protected

  def valid_wagon!(wagon)
    raise 'Какой-то странный тип вагона' if wagon != ('cargo' || 'passenger')
  end
end

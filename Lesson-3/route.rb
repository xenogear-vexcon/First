require_relative 'instance_counter'

class Route
  include InstanceCounter
  attr_reader :stations

  @@stations = []

  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    validate!
    @@stations = [first_station, last_station]
  end

  def add_station(station)
    raise 'Названия станции должно иметь минимум 5 символов' if station.length < 5

    @@stations.insert(-2, station)
  end

  def delete_station(station)
    @@stations.delete(station)
  end

  def show_route_stations
    @@stations
  end

  def validate?
    validate!
    true
  rescue
    false
  end

  private

  def validate!
    raise 'Названия станции должно иметь минимум 5 символов' if (@first_station.length < 5) || (@last_station.length < 5)
  end

end

require './modules/validation'
require './modules/instance_counter'

class Station
  include Validation
  include InstanceCounter
  attr_reader :station_name, :list_of_trains

  @@stations = []

  def self.all
    @@stations
  end

  def initialize(station_name)
    @station_name = station_name
    validate!
    @@stations << self
    register_instance
    @list_of_trains = []
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

  private

  def validate!
    raise 'Названия станции должно иметь минимум 5 символов' if @station_name.length < 5
  end
end

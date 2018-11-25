class Station
  attr_reader :name, :list_of_trains

  @@stations = []

  def initialize(name)
    @name = name
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
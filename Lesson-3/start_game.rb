class StartGame
  def initialize
    @stations = []
    @routes = []
    @trains = []
    @wagons = []
  end

  def start
    puts 'Приветствую в мини-игре!'
    loop do
      puts "Выберите что мы будем делать:
            1 - добавить станцию
            2 - добавить поезд
            3 - создать маршрут
            4 - назначить маршрут поезду
            5 - создать вагон
            6 - добавить вагон к поезду
            7 - отцепить вагон от поезда
            8 - переместить поезд по маршруту
            9 - просмотреть список станций и поездов
            0 - выход"

      input = gets.to_i

      case input
      when 1
        add_station
      when 2
        add_train
      when 3
        create_route
      when 4
        route_to_the_train
      when 5
        add_wagon
      when 6
        add_wagon_to_train
      when 7
        remove_wagon_from_train
      when 8
        change_station
      when 9
        list_stations_and_trains
      when 0
        break
      else
        puts 'Введено некорректное значение!'
      end
    end
  end

  protected

  def add_station
    print 'Введите название станции: '
    station = Station.new(gets.chomp)
    @stations << station
    puts "Новая станция - #{station.station_name}."
    puts "Список всех станций: #{@stations}"
  end

  def add_train
    print 'Добавить пассажирский поезд - 1, грузовой - 2: '
    type = gets.to_i

    print 'Так же введите номер поезда: '
    @train_number = gets.chomp

    case type
    when 1
      @train = PassengerTrain.new(@train_number)
    when 2
      @train = CargoTrain.new(@train_number)
    else
      raise 'Введен неправильный тип поезда!'
    end

    @trains << @train

    puts "Добавлен поезд под номером #{@train_number}."
    p @trains
  end

  def create_route
    puts 'Создаем маршрут. Для начала введем номер маршрута, ' \
         'начальную и конечную станции!'
    print 'Введите номер маршрута: '
    @route_number = gets.to_i

    @route = find_route_number(@route_number)

    print 'Первая станция: '
    first_station = gets.chomp
    print 'Последняя станция: '
    last_station = gets.chomp

    @route = Route.new(first_station, last_station)

    print 'Теперь добавим - "1", или удалим станцию - "2": '
    input = gets.to_i
    print 'Название станции: '
    station = gets.chomp

    case input
    when 1
      @route.add_station(station)
    when 2
      @route.delete_station(station)
    else
      raise 'Такого варианта нет'
    end

    @routes << @route

    puts "Наш новый маршрут: #{@route.stations}, номер - #{@route_number}"
    p @routes
  end

  def route_to_the_train
    print 'Назначить маршрут пассажирскому поезду - "1", грузовому - "2": '
    input = gets.to_i

    if input == 1
      type = PassengerTrain
    elsif input == 2
      type = CargoTrain
    else
      puts 'Неверный маршрут'
    end

    print 'Номер поезда: '
    @train_number = gets.chomp

    @train = find_train(@train_number, type)

    unless @train
      puts 'Такого поезда нет'
      return
    end

    show_routes
    print 'Какой маршрут добавим? '
    @route_number = gets.chomp
    @route = find_route_number(@route_number)

    if @route.nil?
      puts "Маршрута с номером #{@route_number} нет"
    else
      @train.add_route(@route)
      puts "Поезду #{@train_number} установлен маршрут #{@route.stations.first.name}",
           " - #{@route.stations.last.name}."
    end
  end

  def add_wagon
    puts 'Создаем новый вагон: 1 - для создания пассажирского, 2 - для грузового.'
    input = gets.to_i

    print 'Введите номер выгона: '
    @wagon_number = gets.to_i

    if input == 1
      @wagon = PassengerWagon.new(@wagon_number)
    elsif input == 2
      @wagon = CargoWagon.new(@wagon_number)
    else
      puts 'Неверный ввод!'
    end

    @wagons << @wagon

    puts "Созданные вагоны: #{@wagons}."
  end

  def add_wagon_to_train
    current_trains_info

    print 'Введите номер поезда: '
    @train_number = gets.to_i

    train_by_type

    return unless @train

    print 'Введите номер вагона: '
    @wagon_number = gets.to_i

    wagon_by_type

    if @wagon
      @train.add_wagon(@wagon)
      puts "Поезду #{@train.number} был добавлен вагон #{@wagon.number}"
      @wagons.delete(@wagon)
    else
      puts 'Ничего не произошло((('
    end
  end

  def remove_wagon_from_train
    current_trains_info

    print 'Введите номер поезда: '
    @train_number = gets.to_i

    train_by_type

    return unless @train

    print 'Введите номер вагона: '
    @wagon_number = gets.to_i

    wagon_by_type

    if @wagon
      @train.remove_wagon(@wagon)
      puts "От поезда #{@train.number} отцепили вагон #{@wagon.number}"
    else
      puts 'Ничего не произошло((('
    end
  end

  def change_station
    current_trains_info "\n"

    print 'Введите номер поезда: '
    @train_number = gets.to_i

    train_by_type

    return unless @train

    puts 'Введите 1 - для перемещния вперед по маршруту, 2 - для перемещения назад.'
    position = gets.to_i

    if position == 1
      @train.moving_forward
      puts "Поезд был перемещен вперед на станцию #{@train.current_station.station_name}"
    elsif position == 2
      @train.moving_backward
      puts "Поезд был перемещен назад на станцию #{@train.current_station.station_name}"
    else
      puts 'Некорректное значение!'
    end
  end

  def list_stations_and_trains
    puts 'Список станций и поездов: '
    @stations.each.with_index(1) do |station, index|
      puts "#{index}: Станция #{station.station_name}"
    end
    @trains.each.with_index(1) do |train, index_train|
      puts " #{index_train}: Поезд номер #{train.number}"
    end
  end

  def current_trains_info
    puts "#{show_trains(PassengerTrain)}\n"
    puts "#{show_wagons(PassengerWagon)}\n"
    puts "#{show_trains(CargoTrain)}\n"
    puts "#{show_wagons(CargoWagon)}\n"
  end
end

def find_route_number(number)
  @routes[number.to_i - 1]
end

def find_train(train_number, type)
  trains = @trains.select { |train| train.class == type }
  trains.detect { |train| train.number == train_number }
end

def train_by_type
  if @train_number == 1
    @train = find_train(@train_number, PassengerTrain)
  elsif @train_number == 2
    @train = find_train(@train_number, CargoTrain)
  end
end

def find_wagon(wagon_number, type)
  wagons = @wagons.select { |wagon| wagon.class == type }
  wagons.detect { |wagon| wagon.number == wagon_number }
end

def wagon_by_type
  if @wagon_number == 1
    @wagon = find_wagon(@wagon_number, PassengerWagon)
  elsif @wagon_number == 2
    @wagon = find_wagon(@wagon_number, CargoWagon)
  end
end

def show_trains(type)
  if type == PassengerTrain
    puts 'Список пассажирских поездов:'
  elsif type == CargoTrain
    puts 'Список грузовых поездов:'
  end

  trains = @trains.select { |train| train.class == type }

  trains.each { |train| puts train }
end

def show_wagons(type)
  if type == PassengerWagon
    puts 'Список пассажирских вагонов:'
  elsif type == CargoWagon
    puts 'Список грузовых вагонов:'
  end

  wagons = @wagons.select { |wagon| wagon.class == type }

  wagons.each { |wagon| puts wagon }
end

def show_stations
  puts 'Список станций:'
  @stations.each.with_index(1) do |station, index|
    puts "#{index}: #{station.name}"
  end
end

def show_routes
  puts 'Список маршрутов: '
  @routes.each.with_index(1) do |route, index|
    puts "#{index}: #{@route_number} - #{route.stations.first} - #{route.stations.last}"
  end
end

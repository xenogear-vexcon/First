require_relative './route'
require_relative './station'
require_relative './train'
require_relative './train_cargo'
require_relative './train_pass'
require_relative './wagon'
require_relative './wagon_cargo'
require_relative './wagon_pass'

puts "Приветствую в мини-игре!\nВыберите что мы будем делать: "
puts " 1 - добавить станцию
       2 - добавить поезд
       3 - создать маршрут
       4 - назначить маршрут поезду
       5 - добавить вагон
       6 - отцепить вагон
       7 - переместить поезд по маршруту
       8 - просмотреть список станций и поездов
       0 - выход"
loop do
  input = gets.to_i

  if input == 1
    puts 'Введите название станции: '
    station = Station.new(gets.chomp)
    puts "Все станции #{Station.stations}"
    puts "Еще раз? \"#{input}\" - чтобы продолжить."
  elsif input == 2
    puts 'Какой поезд будем добавлять? cargo или passenger?'
    input = gets.chomp
    if input = 'cargo'
      tr1 = CargoTrain.new
  end
end

class Interface

  attr_accessor :player, :dealer, :player_bank, :dealer_bank

  def initialize
    @end_game = false
    welcome
  end

  def welcome
    puts 'Начинаем игру!'
  end

  def info
    puts "Твои карты: "
    @player.cards.each { |card| print "#{card.rank}#{card.suit} " }
    puts "Cумма карт - #{@player.cards_sum}, банк - #{@player_bank.money}"
    puts "Банк дилера - #{@dealer_bank.money}"
  end

  def question
    print "Что делаем дальше, #{@player.name}? 1 - пропуск хода, 2 - взять еще карту, 3 - открыть карты: "
  end

  def continue_of_game
    puts 'Хотите продолжить игру? Нажмите любую цифру для продолжения и 0 для выхода:'
    input = gets.to_i
    if input == 0
      out_of_game_info
      exit
    end
  end

  def out_of_game_info
    puts "#{@player.name} закончил игру и сохранил #{@player_bank.money} долларов в своем кармане."
  end

  def create_player
    print 'Введите ваше имя: '
    gets.chomp
  end

  def separator
    puts '------------------------------------'
  end

  def open_cards
    puts "Карты игрока - "
    @player.cards.each { |card| print "#{card.rank}#{card.suit} " }
    puts "сумма карт - #{@player.cards_sum}."
    puts "Карты дилера - "
    @dealer.cards.each { |card| print "#{card.rank}#{card.suit} " }
    puts "сумма карт - #{@dealer.cards_sum}."
  end

  def winner(participant)
    separator
    if participant == @dealer
      puts 'дилер победил'
    elsif participant == @player
      puts 'игрок победил'
    else
      puts 'ничья, куш поровну'
    end
    separator
  end

  def error
    puts 'некорректное значение'
  end
end

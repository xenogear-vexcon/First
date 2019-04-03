require './cards'

class StartGame

  include Cards

  def start

    print 'Начинаем игру! Введите ваше имя: '
    @player = Participant.new(gets.chomp.capitalize!)
    @dealer = Participant.new

    loop do

      separator

      first_player_cards
      @player.money = @player.money - BET

      take_card(@dealer, 2)
      @dealer.money = @dealer.money - BET

      puts "Твои карты: #{@player.cards.keys}, сумма карт - #{sum_of_cards(@player)}, банк - #{@player.money}"
      puts "Банк дилера - #{@dealer.money}"

      print "Что делаем дальше, #{@player.name}? 1 - пропуск хода, 2 - взять еще карту, 0 - покинуть игру: "
      input = gets.to_i

      case input
        when 1
          skip_a_turn
        when 2
          take_card(@player, 1)
          take_card(@dealer, 1) if sum_of_cards(@dealer) < 17
          result
        when 0
          puts "#{@player.name} закончил игру и сохранил #{@player.money} долларов в своем кармане."
          break
        else
          puts 'некорректное значение'
          @player.money += BET
          @dealer.money += BET
          refresh
      end

      break if end_game?

      separator
    end
  end

  protected

  def skip_a_turn
    take_card(@dealer, 1) if sum_of_cards(@dealer) < 17
    result
  end

  def result
    open_cards
    if (sum_of_cards(@player) < sum_of_cards(@dealer)) && (sum_of_cards(@dealer) <= 21) || (sum_of_cards(@player) > 21)
      @dealer.money += PRIZE
      puts 'дилер победил'
    elsif (sum_of_cards(@player) > sum_of_cards(@dealer)) && (sum_of_cards(@player) <= 21) || (sum_of_cards(@dealer) > 21)
      @player.money += PRIZE
      puts 'игрок победил'
    elsif sum_of_cards(@player) == sum_of_cards(@dealer)
      puts 'ничья, куш поровну'
      (@player.money += (PRIZE/2)) && (@dealer.money += (PRIZE/2))
    end
    refresh
  end

  def end_game?
    (@player.money == 0) || (@dealer.money == 0)
  end

  def separator
    puts '------------------------------------'
  end

end

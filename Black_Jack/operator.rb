
class StartGame

  BET = 10
  PRIZE = 20

  def initialize
    @interface = Interface.new
    @player = Participant.new(@interface.create_player)
    @interface.player = @player
    @dealer = Participant.new
    @interface.dealer = @dealer
  end

  def start

    loop do

      2.times { @interface.separator }
      @deck = Deck.new

      2.times { @player.take_card(@deck.add_card) }
      @player.money = @player.money - BET
      @player.sum_of_cards

      2.times { @dealer.take_card(@deck.add_card) }
      @dealer.money = @dealer.money - BET
      @dealer.sum_of_cards

      @interface.info
      @interface.question
      input = gets.to_i

      case input
        when 1
          skip_a_turn
        when 2
          @player.take_card(@deck.add_card)
          @player.sum_of_cards
          @dealer.take_card(@deck.add_card) if @dealer.cards_sum < 17
          @dealer.sum_of_cards
          result
        when 0
          out_of_game_info
          break
        else
          @interface.error
          @player.money += BET
          @dealer.money += BET
          refresh
      end

      break if end_game?
      @interface.continue_of_game
    end
  end

  protected

  def skip_a_turn
    @dealer.take_card(@deck.add_card) if @dealer.cards_sum < 17
    @dealer.sum_of_cards
    result
  end

  def result
    @interface.open_cards
    if (@player.cards_sum < @dealer.cards_sum) && (@dealer.cards_sum <= 21) || (@player.cards_sum > 21)
      @dealer.money += PRIZE
      @interface.winner(@dealer)
    elsif (@player.cards_sum > @dealer.cards_sum) && (@player.cards_sum <= 21) || (@dealer.cards_sum > 21)
      @player.money += PRIZE
      @interface.winner(@player)
    elsif @player.cards_sum == @dealer.cards_sum
      (@player.money += (PRIZE/2)) && (@dealer.money += (PRIZE/2))
      @interface.winner
    end
    @player.refresh
    @dealer.refresh
  end

  def end_game?
    (@player.money == 0) || (@dealer.money == 0)
  end

  def refresh
    @cards = []
    @sum_of_cards = 0
  end

end

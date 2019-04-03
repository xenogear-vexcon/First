module Cards

  BET = 10
  PRIZE = 20
  DECK_OF_CARDS = {'2+' => 2, '3+' => 3, '4+' => 4, '5+' => 5, '6+' => 6, '7+' => 7,
                  '8+' => 8, '9+' => 9, '10+' => 10, 'K+' => 10, 'Q+' => 10, 'J+' => 10,
                  'A+' => 11, '2<З' => 2, '3<З' => 3, '4<З' => 4, '5<З' => 5, '6<З' => 6,
                  '7<З' => 7, '8<З' => 8, '9<З' => 9, '10<З' => 10, 'K<З' => 10,
                  'Q<З' => 10, 'J<З' => 10, 'A<З' => 11, '2<>' => 2, '3<>' => 3,
                  '4<>' => 4, '5<>' => 5, '6<>' => 6, '7<>' => 7, '8<>' => 8, '9<>' => 9,
                  '10<>' => 10, 'K<>' => 10, 'Q<>' => 10, 'J<>' => 10, 'A<>' => 11,
                  '2^' => 2, '3^' => 3, '4^' => 4, '5^' => 5, '6^' => 6, '7^' => 7,
                  '8^' => 8, '9^' => 9, '10^' => 10, 'K^' => 10, 'Q^' => 10,
                  'J^' => 10, 'A^' => 11}

  def first_player_cards
    @player.cards.merge!(DECK_OF_CARDS.to_a.sample(2).to_h)
    @new_deck_of_cards = DECK_OF_CARDS.reject { |key| @player.cards.include?(key)}
    sum_of_cards(@player)
  end

  def take_card(participant, n)
    participant.cards.merge!(@new_deck_of_cards.to_a.sample(n).to_h)
    @new_deck_of_cards = @new_deck_of_cards.reject { |key| participant.cards.include?(key)}
    sum_of_cards(participant)
  end

  def open_cards
    puts "Карты игрока - #{@player.cards.keys}, сумма карт - #{sum_of_cards(@player)}."
    puts "Карты дилера - #{@dealer.cards.keys}, сумма карт - #{sum_of_cards(@dealer)}."
  end

  def sum_of_cards(participant)
    if (participant.cards.values.include?(11)) && (participant.cards.values.sum > 21)
      participant.cards.values.sum - 10
    else
      participant.cards.values.sum
    end
  end

  def refresh
    @player.cards.clear
    @dealer.cards.clear
  end

end

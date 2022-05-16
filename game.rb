# frozen_string_literal: true

# Класс Game хранит в себе логику процесса игры.
class Game
  attr_reader :player, :dealer, :deck, :winner

  MAX_POINT = 21
  POINT_DEALER = 17

  def create_players(name)
    @player = User.new(name)
    @dealer = Dealer.new
  end

  def deal
    @deck = Deck.new
    2.times do
      deck.take_card(player)
      deck.take_card(dealer)
    end
  end

  def bet
    player.make_a_bet
    dealer.make_a_bet
  end

  def dealer_first
    if dealer.sum_point >= POINT_DEALER
      puts 'дилер пропускает, ваш ход'
    else
      deck.take_card(dealer)
      ace_point_dealer
      puts 'дилер взял карту, ваш последний ход'
    end
  end

  def player_move_second
    deck.take_card(player)
    puts "Выпала карта: #{player.cart.last.name}#{player.cart.last.suit}"
  end

  def dealer_move_second
    if dealer.cart.size == 3 || dealer.sum_point >= POINT_DEALER
      puts 'дилер пропускает ход, вскрываем карты'
    else
      puts 'дилер берет карту'
      deck.take_card(dealer)
    end
  end

  def ace_point_dealer
    dealer.ace_point
  end

  def ace_point_player
    player.ace_point
  end

  def determine_the_winner
    if player.sum_point <= MAX_POINT && player.sum_point > dealer.sum_point
      @winner = 'player'
      player.winning_money
    elsif player.sum_point == dealer.sum_point
      @winner = 'draw'
      player.return_a_bet
      dealer.return_a_bet
    else
      @winner = 'loose'
    end
  end
end

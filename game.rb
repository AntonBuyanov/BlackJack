# frozen_string_literal: true

# Класс Game хранит в себе логику процесса игры.
class Game
  attr_reader :player, :dealer, :deck, :winner, :option

  MAX_POINT = 21
  POINT_DEALER = 17
  MAX_COUNT_CARD = 3

  def create_players(name)
    @player = Player.new(name)
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
      @option = 'miss'
    else
      deck.take_card(dealer)
      ace_point_dealer
      @option = 'last'
    end
  end

  def player_move_second
    deck.take_card(player)
  end

  def dealer_move_second
    if dealer.cart.size == MAX_COUNT_CARD || dealer.sum_point >= POINT_DEALER
      @option = 'last_miss'
    else
      @option = 'take'
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

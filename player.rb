# frozen_string_literal: true

# Класс Player позволяет создавать экземпляры игроков. На старте у игрока 100 кредитов.
class Player
  attr_accessor :cart, :credit

  START_CASH = 100
  BET = 10

  def initialize(name)
    @name = name
    @credit = START_CASH
    @cart = []
  end

  def make_a_bet
    @credit -= BET
  end

  def return_a_bet
    @credit += BET
  end

  def winning_money
    @credit += BET * 2
  end

  def sum_point
    @sum_point = []
    @cart.each { |n| @sum_point << n.point }
    @sum_point.sum
  end

  def each_cart
    @cart.each { |n| print n.name, n.suit, ' ' }
  end
end

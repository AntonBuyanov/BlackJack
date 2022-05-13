# frozen_string_literal: true

# Класс Player позволяет создавать экземпляры игроков. На старте у игрока 100 кредитов.
class Player
  attr_reader :cart

  def initialize(name)
    @name = name
    @credit = 100
    @cart = []
  end

  def make_a_bet
    @credit -= 10
  end

  def return_a_bet
    @credit += 10
  end

  def winning_money
    @credit += 20
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

require_relative 'deck'

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

  def sum_point
    @sum_point = []
    @cart.each { |n| @sum_point << n.point }
    @sum_point.sum
  end
end

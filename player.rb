# frozen_string_literal: true

# Класс Player позволяет создавать экземпляры игроков. Атрибуты - имя, кредиты, карты. На старте 100 кредитов.
class Player
  include Validation
  attr_accessor :cart, :credit

  ACE = 'туз'
  MAX_POINT_ACE = 11
  MIN_POINT_ACE = 1
  START_CASH = 100
  BET = 10

  validate :name, :presence
  validate :name, :format, /^[А-ЯA-Z][а-яA-Z]+/.freeze

  def initialize(name)
    @name = name
    @credit = START_CASH
    @cart = []
    validate!
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

  def ace_point
    if cart.last.name == ACE && sum_point - cart.last.point <= MAX_POINT_ACE
      cart.last.point = MAX_POINT_ACE
    elsif cart.last.name == ACE
      cart.last.point = MIN_POINT_ACE
    end
  end

  def sum_point
    @sum_point = []
    @cart.each { |n| @sum_point << n.point }
    @sum_point.sum
  end
end

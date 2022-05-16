# frozen_string_literal: true

# Класс Dealer наследник класса Player. Хранит в себе метод логики выбора значения туза.
class Dealer < Player
  MAX_POINT_ACE = 11
  MIN_POINT_ACE = 1

  def initialize(name = 'дилер')
    super
  end

  def ace_point
    if cart.last.name == 'туз' && sum_point - cart.last.point <= MAX_POINT_ACE
      cart.last.point = MAX_POINT_ACE
    elsif cart.last.name == 'туз'
      cart.last.point = MIN_POINT_ACE
    end
  end
end

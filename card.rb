# frozen_string_literal: true

# Класс Card позволяет создавать карты с именем, мастью и значением карты.
class Card
  attr_accessor :point
  attr_reader :name, :suit

  def initialize(name, suit, point)
    @name = name
    @point = point
    @suit = suit
  end
end

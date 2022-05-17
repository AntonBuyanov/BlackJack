# frozen_string_literal: true

# Класс Deck позволяет создавать экземпляр колоды из 52 карт. Перетасовывает колоду в момент, когда отдает карту игроку.
class Deck
  attr_accessor :deck

  NUMBERS = (2..10).freeze
  RANKS = %w[валет дама король туз].freeze
  SUITS = %w[♣ ♦ ♥ ♠].freeze
  POINT_RANKS = 10

  def initialize
    create_deck
  end

  def take_card(player)
    @deck.shuffle!
    player.cart << @deck.pop
  end

  def create_deck
    @deck = []
    SUITS.each do |suit|
      NUMBERS.each do |value|
        card = Card.new(value.to_s, suit.to_s, value)
        @deck << card
      end
    end
    create_symbol
  end

  def create_symbol
    SUITS.each do |suit|
      RANKS.each do |symbol|
        card = Card.new(symbol.to_s, suit.to_s, POINT_RANKS)
        @deck << card
      end
    end
  end
end

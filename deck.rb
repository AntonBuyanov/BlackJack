# frozen_string_literal: true

# Класс Deck позволяет создавать экземпляр колоды из 52 карт.
class Deck
  attr_accessor :deck

  NUMBERS = (2..10).freeze
  RANKS = %w[валет дама король туз].freeze
  SUITS = %w[♣ ♦ ♥ ♠].freeze

  def initialize
    create_deck
  end

  def take_card(player)
    @deck.shuffle!
    card = @deck[0]
    player.cart << card
    @deck.delete_at(0)
  end

  def next_card
    @deck.shuffle
    card = @deck.first
    @deck.delete(card)
  end

  def create_deck
    @deck = []
    SUITS.each do |suit|
      NUMBERS.each do |value|
        card = Card.new(value.to_s, suit.to_s, value)
        @deck << card
      end
    end
    SUITS.each do |suit|
      RANKS.each do |symbol|
        card = Card.new(symbol.to_s, suit.to_s, 10)
        @deck << card
      end
    end
  end
end

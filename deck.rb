require_relative 'card'

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
        card = Card.new("#{value}#{suit}", value)
        @deck << card
      end
    end
    SUITS.each do |suit|
      RANKS.each do |symbol|
        card = Card.new("#{symbol}#{suit}", 10)
        @deck << card
      end
    end
  end
end

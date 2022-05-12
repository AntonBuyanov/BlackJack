require_relative 'card'

class Deck

  NUMBERS = (2..10).freeze
  RANKS = %w[валет дама король туз].freeze
  SUITS = %w[♣ ♦ ♥ ♠].freeze

  def initialize
    create_deck
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

p deck1 = Deck.new

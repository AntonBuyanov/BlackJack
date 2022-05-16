# frozen_string_literal: true

require_relative 'interface'
require_relative 'card'
require_relative 'deck'
require_relative 'player'
require_relative 'dealer'
require_relative 'user'
require_relative 'game'

new_game = Interface.new
new_game.start

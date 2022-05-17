# frozen_string_literal: true

# Класс Interface - пользовательский текстовый интерфейс игры в BlackJack.
class Interface
  attr_reader :game

  def initialize
    @game = Game.new
  end

  MENU = 'Выберите действие:
1 - пропустить ход
2 - добавить карту
3 - открыть карты
закрыть - выйти из программы'

  def start
    puts 'Это игра BlackJack. Введите ваше имя'
    name = gets.chomp
    game.create_players(name)
    deal
  end

  def deal
    game.bet
    puts "Сделана ставка. Осталось кредитов: #{game.player.credit}"
    game.deal
    puts 'Ваши карты: '
    game.player.cart.each { |n| print n.name, n.suit, ' ' }
    puts "\nКоличество очков: #{game.player.sum_point}"
    menu
  end

  def menu
    menu =
      { '1' => proc { option_first }, '2' => proc { option_second }, '3' => proc { option_third } }
    loop do
      puts MENU
      option = gets.chomp
      break if option == 'закрыть'

      menu[option].call
    end
  end

  def option_first
    dealer_first
  end

  def option_second
    player_move_second
    game.ace_point_player
    dealer_second
    game.ace_point_dealer
    determine_the_winner
    play_again
  end

  def option_third
    determine_the_winner
    play_again
  end

  def player_move_second
    game.player_move_second
    puts "Выпала карта: #{game.player.cart.last.name}#{game.player.cart.last.suit}"
  end

  def determine_the_winner
    game.determine_the_winner
    case game.winner
    when 'player'
      puts 'Вы победили!'
    when 'draw'
      puts 'Ничья!'
    else
      puts 'Вы проиграли!'
    end
    opening_card
  end

  def dealer_first
    game.dealer_first
    case game.option
    when 'miss'
      puts 'дилер пропускает, ваш ход'
    else
      puts 'дилер взял карту, ваш последний ход'
    end
  end

  def dealer_second
    game.dealer_move_second
    case game.option
    when 'last_miss'
      puts 'дилер пропускает ход, вскрываем карты'
    else
      puts 'дилер берет карту'
    end
  end

  def opening_card
    puts 'Ваши карты: '
    game.player.cart.each { |n| print n.name, n.suit, ' ' }
    puts "\nКарты дилера: "
    game.dealer.cart.each { |n| print n.name, n.suit, ' ' }
    puts " \nУ вас очков: #{game.player.sum_point}, у дилера: #{game.dealer.sum_point}"
  end

  def play_again
    puts 'Сыграем еще раз? да/нет'
    option = gets.chomp
    if option == 'да'
      game.player.cart.clear
      game.dealer.cart.clear
      deal
    else
      exit
    end
  end
end

class BlackJack
  attr_reader :list_players, :list_deck

  def initialize
    @list_players = []
    @list_deck = []
  end

  def start
    puts 'Это игра BlackJack. Введите ваше имя'
    name = gets.chomp
    list_players << Player.new(name)
    list_players << Player.new('дилер')
    menu
  end

  def menu
    player = list_players[0]
    dealer = list_players[1]
    list_deck << Deck.new
    puts "Сделана ставка. Осталось кредитов: #{player.make_a_bet}"
    dealer.make_a_bet
    2.times do
      list_deck[-1].take_card(player).name
      list_deck[-1].take_card(dealer).name
    end
    puts 'Ваши карты: '
    player.each_cart
    puts "\nКоличество очков: #{player.sum_point}"
    select_action
  end

  def select_action
    loop do
      puts 'Выберите действие:
1 - пропустить ход
2 - добавить карту
3 - открыть карты
закрыть - выйти из программы'
      option = gets.chomp
      case option
      when '1'
        dealer_move_first
      when '2'
        player_move_second
        ace_point_player
        dealer_move_second
        ace_point_dealer
        determine_the_winner
        play_again
      when '3'
        determine_the_winner
        play_again
      when 'закрыть'
        break
      else
        puts 'Такого варианта нет'
      end
    end
  end

  def determine_the_winner
    player = list_players[0]
    dealer = list_players[1]
    if player.sum_point <= 21 && player.sum_point > dealer.sum_point
      puts 'Вы победили!'
      opening_card
      player.winning_money
    elsif player.sum_point == dealer.sum_point
      puts 'Ничья!'
      opening_card
      player.return_a_bet
      dealer.return_a_bet
    else
      puts 'Вы проиграли!'
      opening_card
    end
  end

  def ace_point_dealer
    dealer = list_players[1]
    if dealer.cart.last.name == 'туз' && dealer.sum_point - dealer.cart.last.point <= 11
      dealer.cart.last.point = 11
    elsif dealer.cart.last.name == 'туз'
      dealer.cart.last.point = 1
    end
  end

  def ace_point_player
    if list_players[0].cart.last.name == 'туз'
      puts 'Значение туза будет 1 или 11?'
      point = gets.chomp.to_i
      list_players[0].cart.last.point = point
    end
  end

  def dealer_move_first
    if list_players[1].sum_point >= 17
      puts 'дилер пропускает, ваш ход'
    else
      list_deck[-1].take_card(list_players[1])
      ace_point_dealer
      puts 'дилер взял карту, ваш последний ход'
    end
  end

  def dealer_move_second
    if list_players[1].cart.size == 3 || list_players[1].sum_point >= 17
      puts 'дилер пропускает ход, вскрываем карты'
    else
      puts 'дилер берет карту'
      list_deck[-1].take_card(list_players[1])
    end
  end

  def player_move_second
    list_deck[-1].take_card(list_players[0]).name
    puts "Выпала карта: #{list_players[0].cart[-1].name}#{list_players[0].cart[-1].suit}"
  end

  def play_again
    puts 'Сыграем еще раз? да/нет'
    option = gets.chomp
    if option == 'да'
      list_players[0].cart.clear
      list_players[1].cart.clear
      menu
    else
      exit
    end
  end

  def opening_card
    puts 'Ваши карты: '
    list_players[0].each_cart
    puts "\nКарты дилера: "
    list_players[1].each_cart
    puts " \nУ вас очков: #{list_players[0].sum_point}, у дилера: #{list_players[1].sum_point}"
  end
end

class BlackJack

  def menu
    puts 'Это игра BlackJack. Введите ваше имя'
    name = gets.chomp
    p player = Player.new(name)
    p dealer = Player.new("дилер")
    deck1 = Deck.new
    puts "Сделана ставка. Осталось кредитов: #{player.make_a_bet}"
    dealer.make_a_bet
    1.upto(2) do |i|
      puts "Ваша #{i} карта #{deck1.take_card(player).name}"
      puts "У дилера #{i} карта #{deck1.take_card(dealer).name}"
      # sleep(2)
    end
    puts "Количество очков: #{player.sum_point}"
    puts 'Выберите действие:
1 - пропустить ход
2 - добавить карту
3 - открыть карты'
    option = gets.chomp
    case option
    when '1'
      if dealer.sum_point >= 17
        puts "дилер пропускает, ход игрока"
      else
        deck1.take_card(dealer)
        puts "дилер взял карту, ваш последний ход..здесь нужно вернуться к выбору"
        puts "(для меня) у дилера #{dealer.sum_point} очков и #{dealer.cart.size} карт"
      end
    when '2'
      puts "Выпала карта #{deck1.take_card(player).name}"
      if dealer.cart.size == 3
        puts "вскрываем карты, подсчитываем очки, определяем победителя"
        puts "у игрока очков #{player.sum_point}, у дилера #{dealer.sum_point}"
      elsif dealer.sum_point >= 17
        puts "вскрываем карты, подсчитываем очки, определяем победителя"
        puts "у игрока очков #{player.sum_point}, у дилера #{dealer.sum_point}"
      else
        deck1.take_card(dealer)
        puts "вскрываем карты, подсчитываем очки, определяем победителя"
        puts "у игрока очков #{player.sum_point}, у дилера #{dealer.sum_point}"
      end
    when '3'
      puts "вскрываем карты, подсчитываем очки, определяем победителя"
      puts "у игрока очков #{player.sum_point}, у дилера #{dealer.sum_point}"
    else
      puts "Такого варианта нет"
    end
  end
end

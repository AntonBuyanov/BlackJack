# frozen_string_literal: true

# Класс User наследник класса Player. Хранит в себе метод, позволяющий пользователю выбрать значение туза.
class User < Player
  def ace_point
    if cart.last.name == 'туз'
      puts 'Значение туза будет 1 или 11?'
      point = gets.chomp.to_i
      cart.last.point = point
    end
  end
end

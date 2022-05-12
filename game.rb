class Game
  attr_reader :cart

  def initialize(name)
    @name = name
    @credit = 100
    @cart = []
  end

  def add_cart(cart)
    @cart << cart
  end
end

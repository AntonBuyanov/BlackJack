class Card
  attr_accessor :point
  attr_reader :name

  def initialize(name, point)
    @name = name
    @point = point
  end
end

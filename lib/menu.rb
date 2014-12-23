require_relative 'DISHES'

class Menu

  attr_reader :dishes

  def initialize
    @dishes = DISHES
  end

  def add_dish(name, price)
    DISHES << {item: name, price: price}
  end

  def remove_dish(dish)
    DISHES.delete_if{|elem| elem[:item] == dish}
  end
end
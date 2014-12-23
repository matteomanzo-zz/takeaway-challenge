require_relative 'DISHES'

class Menu

  attr_reader :dishes

  def initialize
    @dishes = DISHES
  end

  def add_dish(dish_name, dish_price)
    DISHES << {name: dish_name, price: dish_price}
  end

  def remove_dish(dish_name)
    DISHES.delete_if{|elem| elem[:name] == dish_name}
  end
end
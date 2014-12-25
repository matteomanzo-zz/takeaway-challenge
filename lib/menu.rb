require 'csv'

class Menu

  attr_reader :dishes, :name, :price

  def initialize
    @dishes = {}
    standard_menu
  end

  def standard_menu
    CSV.foreach('dishes.csv') do |elem| 
      @name = elem[0] ; @price = elem[1]
      @dishes[name.to_sym] = price.to_i
    end
  end

  def add_dish(dish_name, dish_price)
    dishes[dish_name.to_sym] = dish_price.to_i
  end

  def remove_dish(dish_name)
    @dishes.delete_if{|elem| elem[name] == dish_name}
  end
end
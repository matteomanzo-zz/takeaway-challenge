require_relative 'dishes.rb'

class Menu

  attr_reader :dishes, :names

  def initialize(dishes = DISHES)
    @dishes = dishes
    @names = []
  end

  def dish_names
    dishes.each{|dish| @names << dish[:name]}
    @names
  end
  # def add_dish(dish_name, dish_price)
  #   dishes << {name: dish_name.to_s, price: dish_price.to_i}
  # end

  # def remove_dish(dish_name)
  #   dishes.delete_if{|dish| dish[:name].to_s == dish_name}
  # end
end
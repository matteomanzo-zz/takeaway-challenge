require_relative 'menu'

class Customer

  attr_reader :basket, :menu

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
  end

  def add_dish(dish_name, quantity, paid)
    menu.dishes.each do |elem|
      basket << {name: dish_name, quantity: quantity.to_i, paid: paid.to_i} if elem[:name] == dish_name.to_s
    end
    basket
  end

  def remove_dish(dish_name)
    basket.delete_if{|dish| dish[:name].to_s == dish_name.to_s}
  end
end
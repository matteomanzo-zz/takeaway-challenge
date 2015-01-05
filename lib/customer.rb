require_relative 'menu'

class Customer

  attr_reader :basket, :menu, :ordered_dishes, :order_total

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
    @ordered_dishes = []
  end

  def add_dish(dish_name, quantity, paid)
    menu.dishes.each do |elem|
      basket << {name: dish_name, quantity: quantity.to_i, paid: paid.to_i} if elem[:name] == dish_name.to_s
    end
    basket
  end

  def remove_dish(dish_name)
    # basket.delete(dish_name) if basket.select {|dish| /#{dish[:name]}/ =~ dish_name.to_s }.sample
    basket.delete_if{|dish| dish[:name].to_s == dish_name.to_s}
  end

  def view_dishes
    basket.each{|cust_dish| ordered_dishes << cust_dish[:name]}
    ordered_dishes
  end

  def total
    @order_total = basket.inject(0){|sum, cust_dish| sum = sum + cust_dish[:paid]}
    order_total
  end
end
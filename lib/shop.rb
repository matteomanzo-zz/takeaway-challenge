require 'menu'
require 'DISHES'
require 'customer'

class Shop

  attr_reader :menu, :order

  def initialize(menu = DISHES)
    @menu = menu
    @order = []
  end

  def check_price(dish_name)
    price = 0
    DISHES.each {|dish| price = dish[:price] if dish[:name] == dish_name}
    price
  end

  def receive(order)
    @order << order
  end
end
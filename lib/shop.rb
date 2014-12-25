require 'menu'
require 'customer'

class Shop

  attr_reader :menu, :order, :name, :price

  def initialize(menu = Menu.new)
    @menu = menu.dishes
    @order = []
  end

  def check_price(dish_name)
    price = 0
    menu.each {|dish| price = dish[1].to_i if dish[0].to_s == dish_name}
    price
  end

  def receive(order)
    @order << order
  end

end
require 'csv'
require_relative 'menu'
require_relative 'customer'

class Shop

  attr_reader :menu, :order, :name, :price, :customer

  def initialize(menu = Menu.new)
    @menu = menu.dishes
    @order = []
    @customer = Customer.new
  end

  def check_price(dish_name)
    price = 0
    menu.each {|dish| price = dish[:price].to_i if dish[0].to_s == dish_name}
    price
  end

  def receive_order(dish, quantity, paying)
    @order << {:dish => dish, :quantity => quantity.to_i, :paying => paying.to_i}
  end

  def view_order
    puts @order
  end
end
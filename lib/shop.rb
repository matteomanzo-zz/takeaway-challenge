require 'csv'
require_relative 'menu'
require_relative 'customer'

class Shop

  attr_reader :menu, :menu_list, :order, :name, :price, :customer

  def initialize(menu = Menu.new)
    @menu = menu
    @menu_list = menu.dishes
    @order = []
    @customer = Customer.new
  end

  def check_price(dish_name)
    price = 0
    menu_list.each {|dish| price = dish[1] if dish[0].to_s == dish_name}
    price
  end

  def receive_order(order)
    @order << order
  end

  def view_order
    puts @order
  end

  def view_customer_payment
    customer.new_order[2]
  end

end
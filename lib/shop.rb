require_relative 'menu.rb'
require_relative 'customer.rb'

class Shop

  attr_reader :menu, :order, :order_total, :customer, :total, :orded_dishes, :cost_total

  def initialize(menu = Menu.new, customer = Customer.new)
    @menu = menu
    @customer = customer
    @order = []
    @total = []
    @orded_dishes = []
    @cost_total = []
  end

  def customer_dishes
    customer.basket.each{|cust_dish| orded_dishes << cust_dish[:name]}
    orded_dishes
  end

  def customer_total
    @order_total = customer.basket.inject(0){|sum, cust_dish| sum = sum + cust_dish[:paid]}
  end

  def total_cost
    self.menu.dishes.each{|dish| customer.basket.each{|cust_dish| @total << (dish[:price].to_i * cust_dish[:quantity].to_i) if cust_dish[:name] == dish[:name]}}
    @cost_total = @total.inject(0){|sum, price| sum = sum + price}
  end

  def right_payment?
    customer_total
    total_cost
    order_total == cost_total
  end
end
require_relative 'menu.rb'
require_relative 'customer.rb'
require_relative 'text'


class Shop

  attr_reader :menu, :order, :order_total, :customer, :total, :ordered_dishes, :cost_total

  def initialize(menu = Menu.new, customer = Customer.new)
    @text = Text.new
    @menu = menu
    @customer = customer
    @order = []
    @total = []
    @ordered_dishes = []
    @cost_total = []
  end

  def customer_dishes
    customer.basket.each{|cust_dish| ordered_dishes << cust_dish[:name]}
    ordered_dishes
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
    @total.clear
    order_total == cost_total
  end

  def confirm
    right_payment? ? (order << customer.basket; send_text!) : 'Your payment is not correct.'
  end

  def send_text!
    text.send!
  end
end
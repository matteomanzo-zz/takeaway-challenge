require_relative 'menu.rb'
require_relative 'customer.rb'
require 'rubygems'
require 'twilio-ruby'

class Shop

  attr_reader :menu, :order, :order_total, :customer, :total, :orded_dishes, :cost_total, :text, :client

  def initialize(menu = Menu.new, customer = Customer.new)
    @client = Twilio::REST::Client.new 'ACd6a43f53972d62b07e2600aa0152fa18', '2013d2eeb583591792048efd68040231'
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
    @total.clear
    order_total == cost_total
  end

  def confirm
    right_payment? ? order << customer.basket : (raise 'Your payment is not correct.')
  end

  private

  def send_text!
    one_hour = 60*60
    time = Time.now + one_hour
    @client.account.sms.messages.create(
      :from => "+441524220092",
      :to =>   "+447479198894",
      :body => "Thank you! Your order was placed and will be delivered before #{time}"
    )
  end

end
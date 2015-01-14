require_relative 'menu.rb'
require_relative 'customer.rb'
require_relative 'text'


class Shop

  attr_reader :menu, :order, :order_total, :customer, :total, :ordered_dishes, :cost_total

  def initialize()
    @text = Text.new
  end

  def send_text!
    text.send!
  end
end
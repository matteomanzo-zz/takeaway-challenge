require 'order'
require 'dishes'

class Customer

  attr_reader :order

  def initialize
    @order = []
  end

  def place_order(dish, quantity, paying)
      @order << {:dish => dish, :quantity => quantity.to_i, :paying => paying.to_i}
  end

end
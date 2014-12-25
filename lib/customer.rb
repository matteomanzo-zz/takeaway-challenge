require 'DISHES'
require 'shop'

class Customer

  attr_reader :new_order

  def initialize(order = @new_order)
    @new_order = []
  end

  def place_order(dish, quantity, paying)
    @new_order << {:dish => dish, :quantity => quantity.to_i, :paying => paying.to_i}
  end

end
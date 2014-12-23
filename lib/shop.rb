require 'menu'
require 'DISHES'

class Shop

  attr_reader :menu

  def initialize(menu = @dishes)
    @menu = menu
  end

  def check_price(dish_name)
    price = 0
    DISHES.each {|dish| price = dish[:price] if dish[:name] == dish_name}
    price
  end

end
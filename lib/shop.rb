require 'menu'

class Shop

  attr_reader :menu

  def initialize(menu = @dishes)
    @menu = menu
  end
end
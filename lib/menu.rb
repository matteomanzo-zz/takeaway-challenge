class Menu

    attr_reader :dishes

  def initialize
    @dishes = [{item: 'chicken caesar salad', price: 10},
               {item: 'pizza', price: 12},
               {item: 'hamburger', price: 15},
               {item: 'spaghetti bolognese', price: 12}]
  end

end
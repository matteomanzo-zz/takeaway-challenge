module Dishes

  def list
    @dishes = [{item: 'chicken caesar salad', price: 10},
               {item: 'spaghetti bolognese', price: 12},
               {item: 'hamburger', price: 15},
               {item: 'pizza', price: 12}
             ]
  end
end
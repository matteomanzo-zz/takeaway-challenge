class Customer

  attr_reader :basket, :name

  def initialize(name = 'Matteo')
    @name = name
    @basket = []
  end

  def add_dish(dish_name, quantity, paid)
      basket << {name: dish_name, quantity: quantity.to_i, paid: paid.to_i}
  end

  def remove_dish(dish_name)
    basket.delete_if{|dish| dish[:name].to_s == dish_name.to_s}
  end

  def view_dishes  
    dishes = []
    basket.each{|cust_dish| dishes << cust_dish[:name]}
    dishes
  end

end
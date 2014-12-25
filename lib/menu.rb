require 'csv'
require 'colorize'

class Menu

  attr_reader :dishes, :dishes_list, :name, :price

  def initialize
    @dishes = {}
    @dishes_list = []
    standard_menu
  end

  def show
    dishes_list.each_with_index{|k, i| puts "#{i+1}. #{k}".blue}
  end

  def standard_menu
    CSV.foreach('dishes.csv') do |elem| 
      @name = elem[0] ; @price = elem[1]
      @dishes[@name.to_sym] = @price.to_i
      @dishes_list << "#{@name}, #{price}"
    end
  end

  def add_dish(dish_name, dish_price)
    dishes[dish_name.to_sym] = dish_price.to_i
  end

  def remove_dish(dish_name)
    dishes.delete_if{|elem| elem[0].to_s == dish_name}
  end
end
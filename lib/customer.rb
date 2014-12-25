class Customer

  attr_reader :new_order

  def initialize(order = @new_order)
    @new_order = []
    @menu = Menu.new
  end

  def place_order
    @menu.show
    puts 'What dish would you like to have?'
    dish = gets.chomp
    puts "How many #{dish}s would you like?"
    quantity = gets.chomp
    puts 'How much is the total?'
    cost = gets.chomp
    new_order << {:dish => dish, :quantity => quantity.to_i, :cost => cost.to_i}
  end

  def view_order
    puts ''
    puts 'Your basket is empty!' if new_order.empty?
    puts ''
    new_order.each{|elem| puts "#{elem}"}
    puts ''
  end

  def delete_item
    puts ''
    view_order
    puts ''
    puts 'Which item would you like to remove?'
    dish = gets.chomp
    new_order.delete_if{|elem| dish == elem[:dish]}
  end
end
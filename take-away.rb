require './lib/menu.rb'
require './lib/customer.rb'
require './lib/shop.rb'

@customer = Customer.new
@menu = Menu.new
@shop = Shop.new

def intro
  puts ''
  puts 'Hello! Welcome to the take away online service'
  puts 'Here it is our menu'
  puts ''
  puts @menu.dishes_list
  puts ''
  puts 'Please, select an option from below...'
  puts ''
end

def options
  puts ''
  puts '1. Add a dish'
  puts '2. View your order'
  puts '3. Delete an item from your order'
  puts '4. Delete your order'
  puts '5. Check and confirm your order'
  puts '9. Exit'
  puts ''
end

def choices(select)
  case select
    when '1' then @customer.place_order
    when '2' then @customer.view_order
    when '3' then @customer.delete_item
    when '4' then @customer.delete_order
    when '5' then 
    when '9' then exit
    
    else puts 'Sorry, that option is not valid, please try again'
  end
end

def interactive_menu
  loop do
    options
    choices(STDIN.gets.chomp)
  end
end

intro
interactive_menu
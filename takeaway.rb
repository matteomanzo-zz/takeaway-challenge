require './lib/shop.rb'
require 'rubygems'
require 'twilio-ruby'
require 'colorize'
require './ACCOUNT_SID.rb'
require './AUTH_TOKEN.rb'

@lineWidth = 70

@shop = Shop.new
@client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN
@view_dishes = []
@shop.menu.dishes.each {|dish, price| @view_dishes << ("#{dish[:name]} - £#{dish[:price]}".cyan.center(@lineWidth))}
@view_basket = []

def intro
  puts ''
  puts ('Welcome to "don\'t cook, just order!"'.yellow.center(@lineWidth))
  puts ''
  puts ('Here\'s our menu:'.yellow.center(@lineWidth))
  puts @view_dishes
  puts ''
  puts ('Please select an option:'.yellow.center(@lineWidth))
end

def options
  puts ''
  puts ('1.        View the menu'.yellow.center(@lineWidth-10))
  puts ('2.   Add a dish to your basket'.yellow.center(@lineWidth-4))
  puts ('3.       View your basket'.yellow.center(@lineWidth-8))
  puts ('4. Remove a dish from your basket'.yellow.center(@lineWidth))
  puts ('5.      Clear your basket'.yellow.center(@lineWidth-8))
  puts ('6.      Confirm your order'.yellow.center(@lineWidth-8))
  puts ('0.             Exit'.light_red.center(@lineWidth-15))
  puts ''
end

def select options
  case options
  when '1' then puts ('Here\'s our menu:'.yellow.center(@lineWidth))
    puts @view_dishes
  when '2' then puts ('Here\'s our menu:'.yellow.center(@lineWidth))
    puts @view_dishes
    puts ''
    puts ('Which dish would you like?'.yellow.center(@lineWidth))
    dish_name = gets.chomp
    while !@shop.menu.dishes.select {|dish| /#{dish[:name]}/ =~ dish_name }.sample
      puts ('Sorry, we don\'t have that dish!'.red.center(@lineWidth))
      puts ''
      puts ('Which dish would you like?'.yellow.center(@lineWidth))
      dish_name = gets.chomp
    end
    puts ("How many portions of #{dish_name} would you like?".yellow.center(@lineWidth))
    quantity = gets.chomp
    puts ('How much is the total?'.yellow.center(@lineWidth))
    paid = gets.chomp
    puts ("#{quantity} #{dish_name}s have been successfully added to your basket!".green.center(@lineWidth))
    @shop.customer.add_dish(dish_name, quantity, paid)
  when '3' then puts ('Your current dishes in the basket are:'.yellow.center(@lineWidth))
    puts ''
    @shop.customer.basket.each {|dish, price, quantity| @view_basket << ("#{dish[:quantity]} portion/s of #{dish[:name]} - paying £#{dish[:paid]}".cyan.center(@lineWidth))}
    !@shop.customer.basket.empty? ? (puts @view_basket) : (puts ('Your basket is empty!'.yellow.center(@lineWidth)))
    @shop.customer_total
    puts ("• Your total is £#{@shop.order_total} •".blue.center(@lineWidth))
    @view_basket.clear
  when '4' then puts ('Which dish would you like to remove?'.yellow.center(@lineWidth))
    dish_name = gets.chomp
    if !@shop.customer.basket.select {|dish| /#{dish[:name]}/ =~ dish_name }.sample
      puts ('That dish is not in your basket!'.red.center(@lineWidth))
    else
      @shop.customer.remove_dish(dish_name)
      puts ''
      puts ('The dish has been successfully removed from your basket.'.green.center(@lineWidth))
    end
  when '5' then @shop.customer.basket.clear
    puts ('Your basket is now empty.'.yellow.center(@lineWidth))
  when '6' then @shop.confirm
     if !@shop.order.empty? 
      send_text!
      puts ('Great! You will soon receive an sms with the expected delivery time! Goodbye and... Enjoy your meal!!'.green.center(@lineWidth))
      exit
    else
      puts ('Your payment is not correct.'.red.center(@lineWidth))
    end
  when '0' then exit
  end
end

def process
  loop do
    options
    select(STDIN.gets.chomp)
  end
end

def send_text!
    one_hour = 60*60
    time = Time.now + one_hour
    @client.account.sms.messages.create(
      :from => "+441524220092",
      :to =>   "+447479198894",
      :body => "Thank you! Your order was placed and will be delivered before #{time}"
    )
end


intro
process


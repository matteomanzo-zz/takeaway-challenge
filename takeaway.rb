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
@shop.menu.dishes.each {|dish, price| @view_dishes << ("#{dish[:name]} - £#{dish[:price]}".blue.center(@lineWidth))}

def intro
  puts ''
  puts ('Welcome to "don\'t cook, just order!"'.yellow.center(@lineWidth))
  puts ''
  puts @view_dishes
  puts ''
  puts ('Please select an option:'.yellow.center(@lineWidth))
end

def options
  puts ''
  puts ('1.        View the menu'.green.center(@lineWidth-10))
  puts ('2.   Add a dish to your basket'.green.center(@lineWidth-4))
  puts ('3.       View your basket'.green.center(@lineWidth-8))
  puts ('4. Remove a dish from your basket'.green.center(@lineWidth))
  puts ('5.      Clear your basket'.green.center(@lineWidth-8))
  puts ('6.      Confirm your order'.green.center(@lineWidth-8))
  puts ('0.             Exit'.light_red.center(@lineWidth-15))
  puts ''
end

def select options
  case options
  when '1' then puts @view_dishes
  when '2' then puts @view_dishes
    puts ''
    puts 'Which dish would you like?'
    dish_name = gets.chomp
    while !@shop.menu.dishes.select {|dish| /#{dish[:name]}/ =~ dish_name }.sample
      puts 'Sorry, we don\'t have that dish!'
      puts ''
      puts 'Which dish would you like?'
      dish_name = gets.chomp
    end
    puts "How many #{dish_name}s?"
    quantity = gets.chomp
    puts 'How much is the total?'
    paid = gets.chomp
    @shop.customer.add_dish(dish_name, quantity, paid)
  when '3' then !@shop.customer.basket.empty? ? (puts @shop.customer.basket) : (puts 'Your basket is empty!')
  when '4' then @shop.customer.remove_dish(gets.chomp)
  when '5' then @shop.customer.basket.clear
  when '6' then @shop.confirm
    !@shop.order.empty? ? send_text! : (puts 'Your payment is not correct.')
    puts 'You will receive an sms with the delivery time' if !@shop.order.empty?
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


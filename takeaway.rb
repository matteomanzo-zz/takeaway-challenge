require './lib/shop.rb'
require 'rubygems'
require 'twilio-ruby'
require 'colorize'
require './ACCOUNT_SID.rb'
require './AUTH_TOKEN.rb'

@lineWidth = 50

@shop = Shop.new
@client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN
@view_dishes = []
@shop.menu.dishes.each {|dish, price| @view_dishes << ("#{dish[:name]} - £#{dish[:price]}".blue.center(@lineWidth+10))}

def intro
  puts ''
  puts ('Welcome to "don\'t cook, just order!"'.center(@lineWidth))
  puts ''
  puts @view_dishes
  puts ''
  puts ('Please select an option:'.center(@lineWidth-3))
end

def options
  puts ''
  puts '1. View the menu'
  puts '2. Add a dish to your basket'
  puts '3. View your basket'
  puts '4. Remove a dish from your basket'
  puts '5. Clear your basket'
  puts '6. Confirm your order'
  puts '0. Exit'
  puts ''
end

def select options
  case options
  when '1' then puts @view_dishes
  when '2' then @shop.customer.add_dish(gets.chomp, gets.chomp, gets.chomp)
  when '3' then !@shop.customer.basket.empty? ? (puts @shop.customer.basket) : (puts 'Your basket is empty!')
  when '4' then @shop.customer.remove_dish(gets.chomp)
  when '5' then @shop.customer.basket.clear
  when '6' then @shop.confirm
    send_text! if !@shop.order.empty?
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


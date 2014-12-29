require './lib/shop.rb'
require 'rubygems'
require 'twilio-ruby'
require 'colorize'

@lineWidth = 50

@shop = Shop.new

def intro
  puts ''
  puts ('Welcome to "don\'t cook, just order!"'.center(@lineWidth))
  @dish_list = @shop.menu.dishes.each {|dish, price| puts ("#{dish[:name]} - £#{dish[:price]}".blue.center(@lineWidth+10))}
end


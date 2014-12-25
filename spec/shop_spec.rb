require 'shop'
require 'menu'
require 'customer'


describe Shop do

  let(:shop){Shop.new}
  let(:menu){Menu.new}
  let(:customer){Customer.new}

  before {allow(customer).to receive(:place_order)}

  it 'should contain a menu' do
    expect(shop.menu).to eq(menu.dishes)
  end

  it 'should check if there is an order' do
    expect{shop.receive_order(customer.new_order)}.to change{shop.order}
  end

  it 'can check the prices of the dishes' do
    expect(shop.check_price('hamburger')).to eq(15)
  end

  it 'should display the customer payment' do
    customer.place_order('pizza', 2, 24)
    expect(shop.dishes_cost(customer.new_order)).to eq 24
  end

  it 'should check the total' do
    expect(shop.right_payment?).to eq true
  end
end
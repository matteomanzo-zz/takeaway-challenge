require 'shop'
require 'menu'
require 'DISHES'
require 'customer'


describe Shop do

  let(:shop){Shop.new}
  let(:menu){Menu.new}
  let(:customer){Customer.new}

  before {allow(customer).to receive(:place_order).and_return('pizza', 2, 24)}

  it 'should contain a menu' do
    expect(shop.menu).to eq(DISHES)
  end

  it 'can check the prices of the dishes' do
    expect(shop.check_price('hamburger')).to eq(15)
  end

  it 'should check if there is an order' do
    expect{shop.receive(customer.new_order)}.to change{shop.order}
  end
end
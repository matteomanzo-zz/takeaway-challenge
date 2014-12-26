require 'shop'
require 'menu'
require 'customer'


describe Shop do

  let(:shop){Shop.new}
  let(:menu){Menu.new}
  let(:customer){Customer.new}

  before {allow(customer).to receive(:place_order)}

  it 'should contain a menu' do
    expect(shop.menu_list).to include(menu.dishes)
  end

  it 'should check if there is an order' do
    expect{shop.receive_order(customer.new_order)}.to change{shop.order}
  end

  it 'can check the prices of the dishes' do
    expect(shop.check_price('beef burger')).to eq(15)
  end

  it 'should check the customer payment' do

  end

  it 'should check the total' do

  end

  it 'should compare the payment with the total' do
    
  end
end
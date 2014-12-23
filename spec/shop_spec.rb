require 'shop'
require 'menu'

describe Shop do

  let(:shop){Shop.new}
  let(:menu){Menu.new}
  let(:customer) {double :customer}

  it 'should contain a menu' do
    expect(shop.menu).to eq(@dishes)
  end
end
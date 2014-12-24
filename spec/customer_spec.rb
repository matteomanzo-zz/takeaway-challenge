require 'customer'
require 'order'

describe Customer do

  let(:customer){Customer.new}
  let(:order){Order.new}

  it 'can take an order' do
    expect{customer.place_order('hamburger', 3, 45)}.to change{customer.order}
  end

end
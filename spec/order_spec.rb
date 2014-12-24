require 'order'

describe Order do

  let(:order){Order.new}

  it 'should be empty by default' do
    expect(order.customer_order).to be_empty
  end

end
require 'customer'


describe Customer do

  let(:customer){Customer.new}

  it 'should have empty order by default' do
    expect(customer.new_order).to be_empty
  end

  it 'can place an order' do
    expect{customer.place_order('hamburger', 3, 45)}.to change{customer.new_order}
  end
end
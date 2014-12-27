require 'customer'


describe Customer do

  let(:customer){Customer.new}

  it 'should have empty order by default' do
    expect(customer.new_order).to be_empty
  end

  xit 'can place an order' do
    expect{customer.place_order}.to change{customer.new_order}
  end

  xit 'can delete an order' do
    customer.place_order
    expect{customer.delete_order}.to change{customer.new_order}.to be_empty
  end
end
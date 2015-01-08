require 'customer'

describe Customer do 

  let(:customer){Customer.new}

  it 'should have an empty basket by default' do 
    expect(customer.basket).to be_empty
  end

  context 'order' do 

    before{customer.add_dish('pizza', 2, 20)}

    it 'can add dishes to the basket' do 
      expect(customer.basket.length).to eq 1
    end

    it 'can display the dishes that are in the basket' do 
      expect(customer.view_dishes).to eq ['pizza']
    end

    it 'can remove dishes from the basket' do
      expect{customer.remove_dish('pizza')}.to change{customer.basket.length}.by -1
    end

    it 'can display the total paid' do
      expect(customer.view_total).to eq 20
    end
  end
end
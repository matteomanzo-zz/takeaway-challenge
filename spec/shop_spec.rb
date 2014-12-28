require 'shop'

describe Shop do 

  let(:shop){Shop.new}

  it 'should be empty by default' do 
    expect(shop.order).to be_empty
  end

  context 'order' do 

     it 'can display the dishes selected by the customer' do 
      shop.customer.add_dish('pasta', 2, 20)
      shop.customer.add_dish('burger', 2, 30)
      expect(shop.customer_dishes).to eq ['pasta', 'burger']
    end

    it 'can display the total paid by the customer' do 
      shop.customer.add_dish('pasta', 2, 20)
      shop.customer.add_dish('burger', 2, 30)
      expect(shop.customer_total).to eq 50
    end

    it 'can display the total cost of the customer order' do 
      shop.customer.add_dish('pasta', 2, 205)
      shop.customer.add_dish('burger', 2, 34)
      expect(shop.total_cost).to eq 50
    end

    it 'should compare the total cost with the total paid' do
      shop.customer.add_dish('pasta', 2, 20)
      shop.customer.add_dish('burger', 2, 30)
      expect(shop.right_payment?).to be true
    end
  end
end
require 'shop'

describe Shop do 

  let(:shop){Shop.new}
  let(:text){Text.new}

  it 'should be empty by default' do 
    expect(shop.order).to be_empty
  end

  context 'correct order' do 

    before do 
      shop.customer.add_dish('pasta', 2, 20)
      shop.customer.add_dish('burger', 2, 30)
    end

     it 'can display the dishes selected by the customer' do 
      expect(shop.customer_dishes).to eq ['pasta', 'burger']
    end

    it 'can display the total paid by the customer' do
      expect(shop.customer_total).to eq 50
    end

    it 'should compare the total cost with the total paid' do
      expect(shop.right_payment?).to be true
    end

    it 'should accept the order if the payment is correct' do
      allow(shop).to receive(:send_text!)
      expect{shop.confirm}.to change{shop.order.length}.by 1
    end
  end

  context 'incorret order' do

    before do
      shop.customer.add_dish('pasta', 2, 21)
      shop.customer.add_dish('burger', 2, 31)
    end

      it 'can display the total cost of the customer order' do 
      expect(shop.total_cost).to eq 50
    end

    it 'should raise an error if the payment is not correct' do
      expect(shop.confirm).to eq 'Your payment is not correct.'
    end
  end
end
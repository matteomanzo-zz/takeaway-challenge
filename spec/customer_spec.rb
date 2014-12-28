require 'customer'

describe Customer do 

  let(:customer){Customer.new}
  let(:menu){Menu.new}

  it 'should have an empty basket by default' do 
    expect(customer.basket).to be_empty
  end

  it 'should have a menu to see dishes' do 
    expect(customer.menu.dishes).to eq(menu.dishes)
  end

  context 'order' do 

    it 'can add dishes to the basket' do 
      expect{customer.add_dish('pizza', 2, 20)}.to change{customer.basket.length}.by 1
    end

    it 'can remove dishes from the basket' do
      customer.add_dish('pasta', 2, 20)
      expect{customer.remove_dish('pasta')}.to change{customer.basket.length}.by -1
    end
  end
end
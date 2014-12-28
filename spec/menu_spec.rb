require './lib/menu.rb'

describe Menu do

  let(:menu){Menu.new}

  it 'should contain dishes by default' do 
    expect(menu.dishes).not_to be_empty
  end

  it 'can display the name of the dishes' do 
    expect(menu.dish_names).to eq ['pizza', 'burger', 'salad', 'pasta']
  end

  # it 'should add a dish' do 
  #   expect{menu.add_dish('piadina', 5)}.to change{menu.dishes.length}.by 1
  # end

  # it 'should delete a dish' do 
  #   expect{menu.remove_dish('pizza')}.to change{menu.dishes.length}.by -1
  # end

end
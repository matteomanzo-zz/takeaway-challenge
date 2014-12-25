require 'menu'

describe Menu do

  let(:menu) {Menu.new}

    it 'should contain dishes' do
      expect(menu.dishes.length).not_to be 0
    end

    it 'can add dishes' do
      expect{menu.add_dish('piadina', 5)}.to change{menu.dishes.length}.by 1
    end

    it 'can remove dishes' do
      expect{menu.remove_dish('pizza margherita')}.to change{menu.dishes.length}.by -1
    end
end
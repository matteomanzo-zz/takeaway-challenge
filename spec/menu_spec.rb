require 'menu'

describe Menu do

  let(:menu) {Menu.new}

    it 'should contain dishes' do
      expect(menu.dishes[0][:item]).to eq 'chicken caesar salad'
    end

    it 'can add dishes' do
      expect{menu.add_dish('piadina', 5)}.to change{menu.dishes.size}.by 1
    end

    it 'can remove dishes' do
      expect{menu.remove_dish('pizza')}.to change{menu.dishes.size}.by -1
    end
end
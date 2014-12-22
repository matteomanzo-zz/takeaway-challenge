require 'menu'

describe Menu do

  let(:menu) {Menu.new}

    it 'should contain dishes' do
      expect(menu.dishes).to eq(@dishes)
    end
end
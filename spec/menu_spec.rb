require 'menu'

describe Menu do

  let(:menu) {Menu.new}

    it 'should contain dishes' do
      expect(menu.dishes)
    end

  context 'dishes' do

    it 'should have prices' do
      expect(menu.dishes[0][:price]).to match(10)
    end
  end
end
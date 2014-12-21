require 'menu'

describe Menu do

  let(:menu) {Menu.new}

  it 'should contain dishes' do
    expect(menu.dishes)
  end

end
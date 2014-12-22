require 'dishes'

class DishesList; include Dishes; end

  describe Dishes do

    let(:dishes) {DishesList.new}

    it 'should have names' do
      expect(dishes.list[2][:item]).to eq('hamburger')
    end

    it 'should have prices' do
      expect(dishes.list[1][:price]).to eq(12)
    end

  end
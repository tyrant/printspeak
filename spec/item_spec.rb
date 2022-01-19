require 'spec_helper'
require_relative '../lib/item'

describe Item do

  describe '#output_line' do
    it "" do 
      item = Item.new(quantity: 3, name: 'Braised Hazelnuts', price: 63.99)
      expect(item.output_line).to eq "3, Braised Hazelnuts, 211.17"
    end
  end
end

require 'spec_helper'
require_relative '../lib/item'

describe Item do

  describe '#output_line' do
    # The line-cost is a teensy bit outside the scope of the test: every single
    # demo test input line quantity is 1. I don't know for sure if the output 
    # value is the per-product price or that price multiplied by quantity. 
    # Common sense would suggest the latter, right? Let's do that.
    it "outputs: quantity, name, line-cost" do 
      item = Item.new(quantity: 3, name: 'Braised Hazelnuts', price: 63.99)
      expect(item.output_line).to eq "3, Braised Hazelnuts, 211.17"
    end
  end
end

class Item

  attr_accessor :product, :quantity

  def initialize(quantity:, name:, price:)
    @quantity = quantity
    @product = Product.new(
        name:  name,
        price: price
      )
  end

  def output_line 

  end
end
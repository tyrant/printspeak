require 'product'

class Item

  attr_accessor :product, :quantity

  def initialize(quantity:, name:, price:)
    @quantity = quantity.to_i
    @product = Product.new(
        name:  name,
        price: price
      )
  end

  def output_line
    "#{@quantity}, #{@product.name}, #{line_cost}"
  end

  def line_cost
    (@product.price_including_tax * @quantity).round(2)
  end
end
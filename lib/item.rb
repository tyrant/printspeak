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
    "#{@quantity}, #{@product.name}, #{sprintf "%.2f", line_price}"
  end

  def line_price
    (@product.price_including_tax * @quantity).round(2)
  end

  def line_sales_tax
    (@product.rounded_sales_tax * @quantity).round(2)
  end
end
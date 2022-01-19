class Product

  SALES_TAX_RATE = 0.1
  IMPORT_DUTY_RATE = 0.05

  attr_accessor :name, :price

  def initialize(name:, price:)
    @name = name
    @price = price.to_f
  end

  def price_including_tax
    (@price + rounded_sales_tax).round(2)
  end

  def rounded_sales_tax
    Product.round_up_to_nearest_5c(basic_sales_tax + import_duty).round(2)
  end

  def basic_sales_tax
    return 0 if basic_sales_tax_exempt?
    (@price * SALES_TAX_RATE).round(2)
  end

  def import_duty
    return 0 if import_duty_exempt?
    (@price * IMPORT_DUTY_RATE).round(2)
  end

  def import_duty_exempt?
    !@name.include?('imported')
  end

  def basic_sales_tax_exempt?
    book? || food? || medical?
  end

  def book?
    @name.include? 'book'
  end

  def food?
    @name.include? 'chocolate'
  end

  def medical?
    @name.include? 'pills'
  end

  # Bit of arithmetic: to get a 5c-rounded-up value, simply multiply the
  # value by 20.0, round up to the nearest integer, then divide by 20.0.
  def Product.round_up_to_nearest_5c(value)
    (value * 20.0).ceil / 20.0
  end
end
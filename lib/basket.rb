require 'csv'

class Basket 

  def initialize(input_path:)
    raise "Can't do a thing without an input_path" if input_path.blank?
    raise "input_path needs to point to an actual file" unless File.exist?(input_path)
    raise "input_path needs to be a CSV file" unless File.extname(input_path) == '.csv'
    csv_headers = CSV.open(input_path, headers: true).read.headers
    unless csv_headers == ['Quantity', 'Product', 'Price']
      raise "The CSV input file's headers must be: Quantity, Product, Price. Not: '#{csv_headers.join(', ')}' The hell's that?"
    end

    load_items_from(input_path: input_path)
  end


  def output


  end

  def load_items_from(input_path:)
    @items = []

    CSV.foreach input_path, headers: true do |row|
      @items << Item.new(
          quantity: row['Quantity'], 
          name:     row['Name'],
          price:    row['Price']
        )
    end
  end


end
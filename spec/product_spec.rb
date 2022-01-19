require 'spec_helper'
require_relative '../lib/product'

describe Product do

  describe '#price_including_tax' do
    it { expect(Product.new(name: 'An imported Iron Cross', price: 4.24).price_including_tax).to eq 4.89 }
  end

  describe '#rounded_sales_tax' do
    it { expect(Product.new(name: 'An imported Iron Cross', price: 4.24).rounded_sales_tax).to eq 0.65 }
  end

  describe '#basic_sales_tax' do
    it { expect(Product.new(name: 'A book', price: 4).basic_sales_tax).to eq 0 }
    it { expect(Product.new(name: "A St. George's Cross", price: 4).basic_sales_tax).to eq 0.4 }
  end

  describe '#import_duty' do
    it { expect(Product.new(name: 'An exported book', price: 4).import_duty).to eq 0 }
    it { expect(Product.new(name: 'An imported book', price: 4).import_duty).to eq 0.2 }
  end

  describe '#import_duty_exempt?' do
    it { expect(Product.new(name: 'An exported book', price: 4).import_duty_exempt?).to eq true }
    it { expect(Product.new(name: 'An imported book', price: 4).import_duty_exempt?).to eq false }
  end

  describe '#basic_sales_tax_exempt?' do
    it { expect(Product.new(name: 'A book', price: 4).basic_sales_tax_exempt?).to eq true }
    it { expect(Product.new(name: 'chocolate', price: 4).basic_sales_tax_exempt?).to eq true }
    it { expect(Product.new(name: 'some pills', price: 4).basic_sales_tax_exempt?).to eq true }
    it { expect(Product.new(name: "A St. George's Cross", price: 4).basic_sales_tax_exempt?).to eq false }
  end

  describe '#book?' do
    it { expect(Product.new(name: 'A book', price: 4).book?).to eq true }
    it { expect(Product.new(name: 'An Iron Cross', price: 4).book?).to eq false }
  end

  describe '#food?' do
    it { expect(Product.new(name: 'chocolate', price: 4).food?).to eq true }
    it { expect(Product.new(name: 'glockenspiel', price: 4).food?).to eq false }
  end

  describe '#medical?' do
    it { expect(Product.new(name: 'some pills', price: 4).medical?).to eq true }
    it { expect(Product.new(name: 'some meat', price: 4).medical?).to eq false }
  end

  describe '.round_up_to_nearest_5c' do
    it { expect(Product.round_up_to_nearest_5c(1.99)).to eq 2.00 }
    it { expect(Product.round_up_to_nearest_5c(2.00)).to eq 2.00 }
    it { expect(Product.round_up_to_nearest_5c(2.04)).to eq 2.05 }
    it { expect(Product.round_up_to_nearest_5c(5.21)).to eq 5.25 }
  end
end
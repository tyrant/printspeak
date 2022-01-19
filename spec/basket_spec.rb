require 'spec_helper'
require_relative '../lib/basket'

describe Basket do

  describe 'Testing standard I/O' do
    subject { Basket.new(input_path: input_path).output }

    describe "producing Output 1 from input1.csv" do

      let(:input_path) { 'input1.csv' }
      let(:output_csv_string) { 
        <<~HEREDOC
          1, book, 12.49
          1, music CD, 16.49
          1, chocolate bar, 0.85

          Sales Taxes: 1.50
          Total: 29.83
        HEREDOC
      }

      it { is_expected.to eq output_csv_string }
    end

    describe "producing Output 2 from input2.csv" do

      let(:input_path) { 'input2.csv' }
      let(:output_csv_string) { 
        <<~HEREDOC
          1, imported box of chocolates, 10.50
          1, imported bottle of perfume, 54.65

          Sales Taxes: 7.65
          Total: 65.15
        HEREDOC
      }

      it { is_expected.to eq output_csv_string }
    end

    describe "producing Output 3 from input3.csv" do

      let(:input_path) { 'input3.csv' }
      let(:output_csv_string) { 
        <<~HEREDOC
          1, imported bottle of perfume, 32.19
          1, bottle of perfume, 20.89
          1, packet of headache pills, 9.75
          1, imported box of chocolates, 11.85

          Sales Taxes: 6.70
          Total: 74.68
        HEREDOC
      }

      it { is_expected.to eq output_csv_string }
    end
  end

  describe "raising errors inside Basket's initializer" do

    context "Supplying nothing at all" do
      it "Complains" do
        expect { Basket.new }
          .to raise_error ArgumentError, "missing keyword: :input_path"
      end
    end

    context "Supplying nil" do
      it "Complains" do
        expect { Basket.new(input_path: nil) }
          .to raise_error "Can't do a thing without an input_path"
      end
    end

    context "Supplying an input_path value not resolving to anything local" do
      it "Complains" do
        expect { Basket.new(input_path: 'blargh.csv') }
          .to raise_error "input_path needs to point to an actual file"
      end
    end

    context "Supplying a CSV file with incorrect headers" do
      it "Complains" do
        expect { Basket.new(input_path: 'spec/fixtures/wrong_headers.csv') }
          .to raise_error "The CSV input file's headers must be: Quantity, Product, Price. Not: 'Great, Googly, Moogly'. The hell's that?"
      end
    end
  end
end
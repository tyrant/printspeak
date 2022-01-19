require 'spec_helper'

describe Basket do

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
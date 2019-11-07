require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }

  describe "#initialize" do
    subject(:brownie) { Dessert.new("brownie", 1, "hina hikawa") }

    it "sets a type" do
      expect(brownie.type).to eq("brownie")
    end

    it "sets a quantity" do
      expect(brownie.quantity).to eq(1)
    end

    it "starts ingredients as an empty array" do
      expect(brownie.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("brownie", "5", "aya maruyama") }.to raise_error(ArgumentError)
    end

  end

  describe "#add_ingredient" do
    subject(:brownie) { Dessert.new("brownie", 1, "himari uehara") }

    it "adds an ingredient to the ingredients array" do
      brownie.ingredients << "brown sugar"
      expect(brownie.ingredients).to include("brown sugar")
    end
  end

  describe "#mix!" do
    subject(:brownie) { Dessert.new("brownie", 1, "kokoro tsurumaki") }

    it "shuffles the ingredient array" do
      original_arr = ["brown sugar", "cocoa", "baking powder", "eggs"]
      brownie.ingredients.concat(original_arr)
      expect(brownie.ingredients.shuffle!).to_not eq(original_arr)
    end
  end

  describe "#eat" do
    subject(:brownie) { Dessert.new("brownie", 5, "moca aoba") }

    it "subtracts an amount from the quantity" do
      brownie.eat(5)
      expect(brownie.quantity).to eq(0)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { brownie.eat(10) }.to raise_error(RuntimeError)
    end
  end

  describe "#serve" do
    subject(:brownie) { Dessert.new("brownie", 5, "sayo hikawa") }

    it "contains the titleized version of the chef's name" do
      expect(brownie.serve).to include("Sayo Hikawa")
    end
  end

  describe "#make_more" do
    subject(:brownie) { Dessert.new("brownie", 5, "ran mitake") }

    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(brownie)
      chef.bake(brownie)
    end
  end
end

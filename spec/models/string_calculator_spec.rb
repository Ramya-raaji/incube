require 'rails_helper'

RSpec.describe StringCalculator do
  describe ".add" do
    context "with an empty string" do
      it "returns 0" do
        expect(StringCalculator.add("")).to eq(0)
      end
    end

     context "with one number" do
      it "returns the number" do
        expect(StringCalculator.add("1")).to eq(1)
      end
    end

     context "with two numbers" do
      it "returns the sum of the numbers" do
        expect(StringCalculator.add("1,5")).to eq(6)
      end
    end

    context "with new lines between numbers" do
      it "returns the sum of the numbers" do
        expect(StringCalculator.add("1\n2,3")).to eq(6)
      end
    end

    context "with a different delimiter" do
      it "returns the sum of the numbers" do
        expect(StringCalculator.add("//;\n1;2")).to eq(3)
      end
    end

    context "with negative numbers" do
      it "throws an exception with negative numbers" do
        expect { StringCalculator.add("1,-2,3,-4") }.to raise_error("Negative numbers not allowed: -2,-4")
      end
    end
  end
end

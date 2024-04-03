require 'rails_helper'
describe StringCalculator do
  describe ".add" do
    context "given an empty string" do
      it "returns zero" do
      input = "", "1", "1,5"
        expect(StringCalculator.add(input)).to eq("0 1 6 ")
      end
    end
  end
end
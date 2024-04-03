require 'rails_helper'
describe StringCalculator do
  describe ".add" do
    context "given an empty string" do
      it "returns zero" do
      input = "", ""
        expect(StringCalculator.add(input)).to eq("0")
      end
    end
  end
end
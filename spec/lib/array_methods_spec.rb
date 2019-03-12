require 'spec_helper'
require '/Users/samanthagibson/Development/code/leetcode-top-interview-questions-array-ruby/lib/array_methods.rb'

describe "#remove_duplicates" do 
  describe "Example 1" do
    it "returns the length of the modified array" do 
      array = [1,1,2]
      expect(remove_duplicates(array)).to eq(2)
    end

    it "modifies the array passed in such that each element only appears once" do 
      array = [1,1,2]
      remove_duplicates(array)

      expect(array).to eql([1,2])
    end
  end
  describe "Example 2" do
    it "returns the length of the modified array" do 
      array = [0,0,1,1,1,2,2,3,3,4]
      expect(remove_duplicates(array)).to eq(5)
    end

    it "modifies the array passed in such that each element only appears once" do 
      array = [0,0,1,1,1,2,2,3,3,4]
      remove_duplicates(array)

      expect(array).to eql([0,1,2,3,4])
    end
  end
end
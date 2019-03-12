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

describe "#max_profit" do 
  describe "Example 1" do
    it "returns the max profit" do 
      array = [7,1,5,3,6,4]
      expect(max_profit(array)).to eq(7)
    end
  end

  describe "Example 2" do
    it "returns the max profit" do 
      array = [1,2,3,4,5]
      expect(max_profit(array)).to eq(4)
    end
  end

  describe "Example 3" do
    it "returns the max profit" do 
      array = [7,6,4,3,1]
      expect(max_profit(array)).to eq(0)
    end
  end
end

describe "#rotate" do 
  describe "Example 1" do
    it "rotates the array to the right by 1 step" do 
      array = [1,2,3,4,5,6,7]
      expect(rotate(array,1)).to eq([7,1,2,3,4,5,6])
    end

    it "rotates the array to the right by 2 steps" do 
      array = [1,2,3,4,5,6,7]
      expect(rotate(array,2)).to eq([6,7,1,2,3,4,5])
    end

    it "rotates the array to the right by 3 steps" do 
      array = [1,2,3,4,5,6,7]
      expect(rotate(array,3)).to eq([5,6,7,1,2,3,4])
    end
  end
  describe "Example 2" do
    it "rotates the array to the right by 1 step" do 
      array = [-1,-100,3,99]
      expect(rotate(array,1)).to eq([99,-1,-100,3])
    end

    it "rotates the array to the right by 2 steps" do 
      array = [-1,-100,3,99]
      expect(rotate(array,2)).to eq([3,99,-1,-100])
    end
  end
end

describe "#contains_duplicate" do 
  describe "Example 1" do
    it "tells if the array contains any duplicates" do 
      array = [1,2,3,1]
      expect(contains_duplicate(array)).to eq(true)
    end
  end

  describe "Example 2" do
    it "tells if the array contains any duplicates" do 
      array = [1,2,3,4]
      expect(contains_duplicate(array)).to eq(false)
    end
  end

  describe "Example 3" do
    it "tells if the array contains any duplicates" do 
      array = [1,1,1,3,3,4,3,2,4,2]
      expect(contains_duplicate(array)).to eq(true)
    end
  end
end

describe "#single_number" do 
  describe "Example 1" do
    it "returns the number that appears once" do 
      array = [2,2,1]
      expect(single_number(array)).to eq(1)
    end
  end

  describe "Example 2" do
    it "returns the number that appears once" do 
      array = [4,1,2,1,2]
      expect(single_number(array)).to eq(4)
    end
  end
end

describe "#intersect" do 
  describe "Example 1" do
    it "returns the bit shared by both arrays" do 
      nums1 = [1,2,2,1], nums2 = [2,2]
      expect(intersect(nums1, nums2)).to eq([2,2])
    end
  end

  describe "Example 2" do
    it "returns the bit shared by both arrays" do 
      nums1 = [4,9,5], nums2 = [9,4,9,8,4]
      expect(intersect(nums1, nums2)).to eq([4,9])
    end
  end
  
end
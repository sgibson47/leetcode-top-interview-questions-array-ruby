require 'pry'

def remove_duplicates(nums)
  nums.uniq!

  nums.length
end

def max_profit(prices)
  #if there's only one day of prices, you can't profit
  return 0 if prices.length < 2
  
  #keep track of whether you own stock
  own_share = false
  #keep track of your profit
  profit = 0

  # loop through each price
  i = 0
  while i <prices.length - 1 do
    # if the price is going up tomorrow, 
    # and you don't already own
    # buy
    if prices[i] < prices[i+1] && !own_share
      profit -= prices[i]
      own_share = true
    end
    # if the price is going down tomorrow, 
    # and you own
    # sell
    if prices[i] > prices[i+1] && own_share
      profit += prices[i]
      own_share = false
    end
    #increment the counter each loop 
    #to move on to the next day's price
    i += 1
  end

  #if you own at the end, sell 
  profit += prices[i] if own_share 

  #return profit
  profit
end

def rotate(nums, k)
  #however many rotations called for
  k.times do
    #take the last element out of the array
    elem = nums.pop
    # add it to the begining of the array
    nums.unshift(elem)
  end
  #return the altered array
  nums
end

def contains_duplicate(nums)
  #compare the length of the orig array
  #with the length of an array of unique elements from the original
  if nums.length != nums.uniq.length
    return true
  else
    return false
  end
end

def single_number(nums)
  i = 0
  while i <nums.length do
    new_nums = nums[0,i].concat(nums[i+1,nums.length-1])
    if !new_nums.include?(nums[i]) 
      return nums[i] 
    end
    i += 1
  end

  # These also work, but I'm not sure how the XOR works with reduce to do it
  # nums.reduce(:^)
  # nums.inject(0) { |a, b| a^b }
  # nums.reduce(0) { |a, b| a^b }
  # nums.reduce { |a, b| a^b }
end
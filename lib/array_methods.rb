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
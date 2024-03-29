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

def right_rotate(nums, k)
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

def intersect(nums1, nums2)
  if nums1.length < 1 || nums2.length < 1
    return []
  end  

  new_nums1 = nums1.sort
  new_nums2 = nums2.sort

  shared =[]
  x = 0
  y = 0

  while !(x >= new_nums1.length || y >= new_nums2.length)
    nums1_elem = new_nums1[x]
    nums2_elem = new_nums2[y]
    if nums1_elem == nums2_elem
      shared.push(nums1_elem)
      x += 1
      y += 1
    elsif nums1_elem < nums2_elem
      x +=1
    else
      y +=1
    end
  end
  shared
end

def plus_one(digits)
  integer = digits.join("").to_i
  integer += 1
  integer.to_s.split("").map! {|x| x.to_i }
end

def move_zeroes(nums)
  zeroes = 0
  nums.each_index do |i|
    if nums[i] == 0
      zeroes += 1
    end
  end

  nums.delete(0)

  zeroes.times do 
    nums.push(0)
  end

  nums
end

def two_sum(nums, target)
  # create hash map to hold elements from nums & their indices
  # elem => index
  elements_and_indices = {}

  # iterate through nums 
  nums.each_with_index do |num, i|
    # if the value needed to reach the target is in the hash map
    # i.e. it appeared earlier in the array
    if elements_and_indices[target - num]
      # grab that element's index from the hash map
      # and return it and the current index
      return elements_and_indices[target - num], i
    end
    # if an element that would add up to the target with the current elem
    # wasn't in the hash map & so we didn't stop executing the loop when 
    # with a return statement
    # add the current index to the hash map at a key of the current value
    elements_and_indices[num] = i
  end
end

def valid_rows?(board)
 # For each row...
  board.each do |row|
     # Get all non-empty cells
     nums = row.reject { |c| c == "." }
   
   # If any of the cells repeat, this is not a valid row.
     return false if nums.uniq.count != nums.count
  end 
  return true
end

def is_valid_sudoku(board)
  # check that integers do not repeat
  # in each row, column, and 3x3 sub-box

  # ¿Grab each row, column & box
  #  & make it into an array
  # delete "." (empty squares)
  # compare condensed_array.length & condensed_array.uniq.length

  # grab & check rows
  return false unless valid_rows?(board)

  # check columns
  return false unless valid_rows?(board.transpose)

  # grab boxes
  boxes = []
  x = 0
  y = 1
  z = 2

  while z <= 8
    a = 0
    b = 1
    c = 2
    while c <= 8
      box = []
      box.push(board[x][a])
      box.push(board[x][b])
      box.push(board[x][c])
      box.push(board[y][a])
      box.push(board[y][b])
      box.push(board[y][c])
      box.push(board[z][a])
      box.push(board[z][b])
      box.push(board[z][c])
      boxes.push(box)
      a +=3
      b +=3
      c +=3
    end
    x +=3
    y +=3
    z +=3
  end

  # check boxes
  #     binding.pry
  boxes.each do|box|
    box.delete(".")
    if box.length != box.uniq.length && box.length != 0
      return false
    end
  end


  # if no return false triggered it's valid
  true
end

def rotate(matrix)
  i = 0
  while i <= matrix.length-1
    j = 0
    while j<= matrix.length-1
      matrix[i].push(matrix[j].shift)
      j += 1
    end
    
    i += 1
  end

  matrix.each do|row|
    row.reverse!
  end

  matrix 
end


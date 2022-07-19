# Write a method that takes an array as an argument, and a block that returns true or false depending on the value of the array element passed to it.

#method returns number of times the block returns true

def count (array)
  counter = 0

  array.each do |ele|
    counter += 1 if yield(ele)
  end

  counter
end

# def count(arr, counter = 0, index = 0, &block) 
#   return counter if index == arr.size
#   counter += 1 if yield(arr[index])
#   index += 1
#   count(arr, counter, index, &block)
# end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2
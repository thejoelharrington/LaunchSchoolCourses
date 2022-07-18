# method that takes assorted array of integers.
# returns array containing all missing integers (in order) between the first and last elements of arg

def missing(array)
  (array[0]..array[(array.size - 1)]).to_a.select{|el| array.include?(el) == false}
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []

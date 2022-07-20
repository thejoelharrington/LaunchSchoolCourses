#write our own version of zip method, takes two arrays and combines them into a single array in which each element is a two-element sub-array.

def zip(arr1,arr2)
  result = []
  index = 0
  
  while index < arr1.size && index < arr2.size
    result << [arr1[index], arr2[index]]
    index +=1
  end

  result
end

p zip([1, 2, 3], [4, 5, 6]) #== [[1, 4], [2, 5], [3, 6]]
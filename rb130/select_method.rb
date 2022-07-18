def select(arr)
  counter = 0
  new_arr = []

  while counter < arr.size
    new_arr << arr[counter] if yield(arr[counter])
    counter += 1
  end

  new_arr
end

array = [1, 2, 3, 4, 5]

p array.select { |num| num.odd? }
p array.select { |num| puts num }
p array.select { |num| num + 1 }
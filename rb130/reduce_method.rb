def reduce(array,acc=array[0])
  counter = 1

  while counter < array.size
    acc = yield(acc, array[counter])
    counter += 1
  end

  acc
end

p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']        # => NoMethodError: undefined method `+' for nil:NilClass
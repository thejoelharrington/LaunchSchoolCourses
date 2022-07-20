def each_with_index(array)
  index = 0
  array.each do |item|
    yield(item, index)
    index += 1
  end
end

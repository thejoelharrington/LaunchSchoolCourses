def drop_while(array)
  index = 0
  while index < array.size && yield(array[index])
    index += 1
  end

  array[index..-1]
end

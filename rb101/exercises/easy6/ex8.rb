def find_dup(array)
  array.find { |element| array.count(element) == 2 }
end
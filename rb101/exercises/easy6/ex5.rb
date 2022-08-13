def reverse(array)
  result_array = []
  array.reverse_each { |element| result_array << element }
  result_array
end
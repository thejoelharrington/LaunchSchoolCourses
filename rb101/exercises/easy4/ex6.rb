def running_total(array)
  sum = 0
  array.map { |value| sum += value }
end

def average(numbers)
  sum = numbers.reduce { |sum, number| sum + number }
  sum / numbers.count
end
def ascii_value(string)
  sum = 0
  string.each_char { |char| sum += char.ord }
  sum
end
def repeater(string)
  result = ''
  string.each_char do |char|
    result << char << char
  end
  result
end
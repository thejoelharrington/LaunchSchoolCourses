def palindromic_number?(number)
  palindrome?(number.to_s)
end

def palindrome?(string)
  string == string.reverse
end
def remove_vowels(strings)
  strings.map { |string| string.delete('aeiouAEIOU') }
end
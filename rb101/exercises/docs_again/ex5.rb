# puts a.fetch(7)
IndexError: index 7 outside of array bounds: -5...5

# puts a.fetch(7, 'beats me')
beats me

# puts a.fetch(7) { |index| index**2 }
49
=begin
  Takes a string of digits and returns all possible consecutive number series of a specified length.

  return all substrings of a specified length 

  create a method called slices that return the arg number of substring lengths

  create method called slices
    -iterate over string turned chars(&:to_i) and put sequence of arg number of integers together in sub_arr inside of return array

  raise argument error if the slice count is greater than the input string length
=end

class Series
  attr_reader :numbers_string, :numbers_array

  def initialize(string)
    @numbers_string = string 
    @numbers_array = numbers_string.chars.map(&:to_i)
  end

  def slices(slice_count)
    raise ArgumentError if slice_count > numbers_array.size

    numbers_array.each_with_object([]).with_index do |(num,arr),idx|
      current_slice = numbers_array[idx...(idx+slice_count)]
      arr << current_slice if current_slice.size == slice_count
    end
  end
end
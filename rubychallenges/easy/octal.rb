class Octal
  attr_reader :octal_arr, :number_str

  def initialize(number_str)
    @number_str = number_str
    @octal_arr = number_str.split('').map(&:to_i)
  end

  def to_decimal
    return 0 unless number_str.chars.all?{|l| l =~ (/[0-7]/)}
    octal_arr.reverse.map.with_index {|n,idx| n*(8**idx)}.sum
  end
end

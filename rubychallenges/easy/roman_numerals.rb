# convert normal numbers into theirf roman numeral counter parts.
# no need to convert numbers larger than 3000.
=begin
  1 is I
  5 is V
  10 is X
  50 is L
  C is 100
  D is 500
  1000 is M

  #to_roman -- should convert arg to roman numeral.

  split arg number into seprate nums and find their roman counter-parts.
  how to find vals?
    -iterate over hash, whichever greatest key can fit into the given number will place its value in new string.

  129 == CXXIX
=end

ROMAN_NUMS = {
    "M" => 1000,
    "CM" => 900,
    "D" => 500,
    "CD" => 400,
    "C" => 100,
    "XC" => 90,
    "L" => 50,
    "XL" => 40,
    "X" => 10,
    "IX" => 9,
    "V" => 5,
    "IV" => 4,
    "I" => 1
  }

class RomanNumeral
  attr_accessor :number

  def initialize(number)
    @number = number
  end

  def to_roman
    roman_value = ''
    current_number = number

    until current_number == 0
      ROMAN_NUMS.each do |k,v|
        if v <= current_number
          current_number -= v
          roman_value << k
          break
        end
      end
    end

    roman_value
  end
end

number = RomanNumeral.new(2004)

p number.to_roman

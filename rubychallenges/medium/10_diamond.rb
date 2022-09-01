=begin
 program takes a diamond_str letter as an arg, outputs it in diamond shape.
  -the arg represents the middle line of the diamond, the distance between the arg and the letter 'A' in the alphabet is the amount of lines in the diamond, each line the LETS between the arg and 'A' 


  structure:
  class method takes the arg.
    -create array from 'A' to arg
    -keep track of the size of array

    the idx of the letter in the array is the number of spaces between that letter and itself on a line.

    (' ' * idx) + [idxarray] + (' ' * idx) 
=end

LETS = {'A'=>0, 'B'=>1, 'C'=>3, 'D'=>5, 'E'=>7 }
class Diamond
  def self.make_diamond(let)
    let_arr = ('A'..let).to_a + ('A'...let).to_a.reverse
    max = let == 'A' ? LETS[let] : LETS[let]+2

    let_arr.each_with_object("") do |l,str|
      LETS[l] == 0 ? str << "#{(l).center(max)}\n" :
      str << "#{(l + (" "*LETS[l]) + l).center(max)}\n"
    end
  end
end

p Diamond.make_diamond('E')
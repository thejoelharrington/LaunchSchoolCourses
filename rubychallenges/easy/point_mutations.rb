# by counting the number of differences between the object and its ancestor, we measure the number of point mutations between them. we call this the hamming distance.

# a difference is counted if the index of the ancestor and the same index of the inherter are a different element.

# If you have two sequences of unequal length, you should compute the Hamming distance over the shorter length.

# a method called hamming_distance takes an all caps string argument and compares it to the strand the object was created with

#psuedo code:

=begin
when instantiated (must be instantiated with string opbject),
save arg in an instanbce variable called strand
when #hamming_distance is called, compare strand to string arg all caps.
only compare up to the length of shortest string. count differences in each index and save them in a counter. return counter.

calculate shortes string?::
  we can iterate over both until one is nil.
  are assign shortes one to a variable and iterate over that.
  iterate over shortest and use [] for longest.
=end

# class DNA
#   def initialize(strand)
#     @strand = strand
#   end

#   def hamming_distance(comparison)
#     shorter = @strand.length < comparison.length ? @strand : comparison
#     differences = 0

#     shorter.length.times do |index|
#       differences += 1 unless @strand[index] == comparison[index]
#     end

#     differences
#   end
# end

class DNA
  def initialize(string)
    @strand = string
  end

  def hamming_distance(string)
    shortest, longest = [@strand, string].sort_by{|x|x.length}

    counter = 0
    shortest.chars.each_with_index {|char,idx|counter += 1 if char != longest[idx]}
    counter
  end
end

dna = DNA.new('AGACAACAGCCAGCCGCCGGATT')

p dna.hamming_distance('AGGCAA')
p dna.hamming_distance('AGACATCTTTCAGCCGCCGGATTAGGCAA')
p dna.hamming_distance('AGG')
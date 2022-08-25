#comparison of the number and the sum of its positive divisors(numbers that can be divided into number woth no remainders)

# the positive divisors with "aliquot sum" that is equal to original number are perfect numbers

# deficient have less, abundant have more

# ie 6 is a perfect number because its divisors 1,2,3 equal 6.
#-----------------------
=begin
algo:

initializer takes number
create method that finds divisors--- 1.upto(number)
find sum of those to determine type.
=end

class PerfectNumber
  def self.classify(number)
    raise StandardError.new("number too low") if number < 1

    sum = 0

    (1...number).each do |n|
      (number.to_f.divmod(n)[1] == 0) ? sum += n : next
    end

    if sum < number
      'deficient' 
    elsif sum > number
      'abundant'
    else
      'perfect'
    end
  end
end

p PerfectNumber.classify(1)

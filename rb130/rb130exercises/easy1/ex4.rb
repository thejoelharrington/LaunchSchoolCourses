#returns list of all divisors of argument passed

def divisors(number)
  number_arr = (1..number).to_a
  divisible = number_arr.reverse.select do |num|
    num if (number.to_f / num) == (number / num)
  end

  divisible.reverse
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
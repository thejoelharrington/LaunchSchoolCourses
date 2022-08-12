# anagram definition = amount of words that can be made from a set of letters.

# need a method called #match, it checks all given arguments (array of strings) to see if they are included in initial string. must contain same amount of each letter.

# eliminate anagram subset test case? makes no sense.

class Anagram
  attr_reader :subject

  def initialize(str)
    @subject = str.downcase
  end

  def match(arr)
    arr.select{|str| str if (anagram?(str.downcase))}
  end

  def anagram?(str)
    str.each_char{|char| return false unless subject.count(char)==str.count(char)&&(str.length==subject.length)}
    str != subject
  end
end

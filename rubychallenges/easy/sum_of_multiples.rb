class SumOfMultiples
  def initialize(*set)
    @set = (set.size>0) ? set : [3,5]
  end

  def self.to(number)
    SumOfMultiples.new().to(num)
  end

  def to(number)
    result = 0
    1.upto(number-1) do |current_number|
      result+=current_number if set.any?{|n| current_number%n == 0}
    end
    result
  end

  private

  attr_reader :set
end

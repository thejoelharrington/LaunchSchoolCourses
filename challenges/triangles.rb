# when creating a triangle object, pass the length of the three sides.
# floats should work in this program.
  # what if length is 0 or negative? -- raise argument error. (initialize method)

# kind method should return the type of triangle the calling object is. (instance variable)

# ArgumentError if total of any two sides are not greater than the third side, any argument is 0 or negative.

# use an array to collect all three sides

class Triangle
  attr_reader :sides

  def initialize(s1,s2,s3)
    @sides = [s1,s2,s3].sort
    raise ArgumentError.new("Sides are not compatible") unless sides_compatible?
  end

  def kind
    if sides.uniq.size == 1
      'equilateral'
    elsif sides.uniq.size == 2
      'isosceles'
    else
      'scalene'
    end
  end

  def sides_compatible?
    sides.all? { |el| el > 0 } && sides.first(2).sum > sides.last
  end
end

triangle = Triangle.new(4,5,4)

class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    temp_upcase = @name.upcase
    "My name is #{temp_upcase}."
  end
end

# name = 'Fluffy'
# fluffy = Pet.new(name)
# puts fluffy.name
# puts fluffy
# puts fluffy.name
# puts name

name = 42
fluffy = Pet.new(name)
name += 1
puts fluffy.name
puts fluffy
puts fluffy.name
puts name

# name starts as an integer when assigned a number outside the class, when entering the class, the name is converted into a string and can be used accordingly. We reassign the local variable name outside the class to name += 1, thus changing it, then we enter that new input into the class, turn it to a string, and use it accordingly.
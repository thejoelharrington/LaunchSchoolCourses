class Person
  attr_accessor :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end
end

bob = Person.new("Robert")

kitty = Cat.new
bud = Bulldog.new

bob.pets << kitty
bob.pets << bud

bob.pets    

# this example assumes classes Cat and Bulldog are already created and each of them can use the jump method.

# to use instance methods on objects such as arrays you need to iterate through them.

bob.pets.each do |pet|
  pet.jump
end
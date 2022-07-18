class Cat
  attr_accessor :name
  COLOR = 'yellow'

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name} and I'm #{COLOR}"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
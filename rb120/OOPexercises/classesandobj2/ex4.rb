class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def self.generic_greeting
    puts "Hello from the class #{self}"
  end

  def personal_greeting
    puts "Hello. I'm the object #{self.name}"
  end
end

kitty = Cat.new('Sophie')

Cat.generic_greeting
kitty.personal_greeting
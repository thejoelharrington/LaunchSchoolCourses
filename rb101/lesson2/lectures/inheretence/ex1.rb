class Pet
  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog < Pet
  def speak
    'bark!'
  end

  def fetch
    'fetching!'
  end

  def swim
    'swimming!'
  end
end

class Cat < Pet
  def speak
    'meow!'
  end
end

class Bulldog < Dog
  def swim
    "can't swim!"
  end
end

karl = Bulldog.new
teddy = Dog.new
puts teddy.speak           # => "bark!"
puts teddy.swim           # => "swimming!"
puts karl.speak
puts karl.swim
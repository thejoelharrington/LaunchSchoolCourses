class Animal
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new
cat1.color

=begin
  method look up path in order:
    -Cat
    -Animal
    -Object
    -Kernel
    -BasicObject
=end
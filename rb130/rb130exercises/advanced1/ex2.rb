
# Group 1
# my_proc = proc { |thing| puts "This is a #{thing}." }
# puts my_proc
# puts my_proc.class
# my_proc.call
# my_proc.call('cat')

=begin
notes:
a proc seems to be an object that acts as a block, a block that can be passed around as a piece of code.
A Proc object does not require that the correct number of arguments are passed to it. If nothing is passed, then nil is assigned to the block variable.
=end

# Group 2
# my_lambda = lambda { |thing| puts "This is a #{thing}." }
# my_second_lambda = -> (thing) { puts "This is a #{thing}." }
# puts my_lambda
# puts my_second_lambda
# puts my_lambda.class
# my_lambda.call('dog')
# my_lambda.call
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }

=begin
  notes:
  A Lambda is actually a different variety of Proc.
  A lambda enforces the number of arguments. If the expected number of arguments are not passed to it, then an error is thrown.
=end


# Group 3
# def block_method_1(animal)
#   yield
# end

# block_method_1('seal') { |seal| puts "This is a #{seal}."}
# block_method_1('seal')

=begin 
  the second call to the method sends a local jmp error because the method requires a block because of the yield keyword.
  A block passed to a method does not require the correct number of arguments. If a block variable is defined, and no value is passed to it, then nil will be assigned to that block variable.
=end

# def block_method_2(animal)
#   yield(animal)
# end

# block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
# block_method_2('turtle') do |turtle, seal|
#   puts "This is a #{turtle} and a #{seal}."
# end
# block_method_2('turtle') { puts "This is a #{animal}."}

=begin
  theres no variable in scope for the last one, it needs one.
  If we pass too few arguments to a block, then the remaining ones are assigned a nil value.
=end



=begin
  Lambdas are types of Proc's. Technically they are both Proc objects. An implicit block is a grouping of code, a type of closure, it is not an Object.
  Lambdas enforce the number of arguments passed to them. Implicit blocks and Procs do not enforce the number of arguments passed in.
=end


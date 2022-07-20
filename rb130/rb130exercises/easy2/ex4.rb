# count returns the number of ele yielded to the block that came back truthy, if the argument list is empty, count should return 0
def count(*args)
  args.each_with_object([]) {|ele,obj| obj << ele if yield(ele)}.size
end

p count(1, 3, 6) { |value| value.odd? } == 2
p count(1, 3, 6) { |value| value.even? } == 1
p count(1, 3, 6) { |value| value > 6 } == 0
p count(1, 3, 6) { |value| true } == 3
p count() { |value| true } == 0
p count(1, 3, 6) { |value| value - 6 } == 3
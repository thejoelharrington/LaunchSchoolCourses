# write a method that does what the step method does, except with three separate arguments rather than a collection.
#1-starting value, 2-ending value, 3-size of step
#every step value will be passed to the block to be displayed
def step(start_value,end_value,step_value)
  current_value = start_value
  value_list = []

  while current_value <= end_value
    yield(current_value)
    value_list << current_value
    current_value += step_value
  end

  value_list
end

step(1, 10, 3) { |value| puts "value = #{value}" }
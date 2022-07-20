#max_by
#passes each element to block, and return ele with largest value returned by block. given array is empty, return nil.

def max_by(array)
  return nil if array.empty?

  max_ele = array[0]
  largest = yield(array[0]) #if this comes out the largest from the block, then the original element before being passed to the block is saved. it returns the element for which the block returned the largest value.

  array.each do |ele|
    if largest < yield(ele)
      largest = yield(ele)
      max_ele = ele
    end
  end

  max_ele
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
max_by([1, 5, 3]) { |value| 9 - value } == 1
max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil
# circular queue is a buffer that acts as if its connected in a circle
# when adding an object it is added immediately before the next most recent object.
# removing an object removes the object that has been there the longest.

# If buffer is full, adding a new object removes the oldest object shifting all objects one spot over.

# circular queue with room for 3 objects.

class CircularQueue

  attr_accessor :buffer, :max_buffer_size

  def initialize(buffer_amount)
    @max_buffer_size = buffer_amount
    @buffer = []
  end

  def enqueue(obj)
    buffer.unshift(obj)
    buffer.pop if buffer.size > max_buffer_size
  end

  def dequeue
    buffer.pop
  end
end

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil
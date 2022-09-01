=begin
  -create a singly linked list.
  -each element contains data and a "next" field pointng to the next element in the list.
  -This type of linked list is often used to represent sequences or push-down stacks.(Last-in, first-out).

  -create a list whose elements contain dany type of data. provide functions to reverse the list and convert a linked list to and from an array.

  each element on the list does not need to know about the others except for the "next" element.

  we need an Element class and List class
=end

=begin
  the head node is the frst element oin the list.

  use head as a pointer to the frst most argument rather than using an array.
  the head is the most recently added item to a list.
=end

class Element
  attr_accessor :data, :next_obj

  def initialize(data,next_obj=nil)
    @data = data
    @next_obj = next_obj
  end

  def datum
    @data
  end

  def tail?
    next_obj == nil
  end

  def next
    next_obj
  end
end

class SimpleLinkedList
  def self.from_a(array)
    array = [] if array.nil?

    list = SimpleLinkedList.new
    array.reverse_each { |datum| list.push(datum) }
    list
  end

  def to_a
    array = []
    current_ele = head
    while !current_ele.nil?
      array.push(current_ele.datum)
      current_ele = current_ele.next
    end
    array
  end

  attr_accessor :head

  def initialize
    @head = nil
  end

  def push(obj)
    self.head = Element.new(obj, head)
  end

  def pop
    return_popped = head
    self.head = return_popped.next
    return_popped.datum
  end

  def size
    counter = 0
    first_ele = self.head
    return counter if first_ele == nil

    loop do
      counter += 1
      self.head = head.next 
      break if head == nil
    end

    self.head = first_ele
    counter
  end

  def empty?
    !self.head
  end

  def peek
    if head
      head.datum
    else
      nil
    end
  end

  def reverse
    list = SimpleLinkedList.new
    current_ele = head
    while !current_ele.nil?
      list.push(current_elem.datum)
      current_ele = current_ele.next
    end
    
    list
  end
end

x = SimpleLinkedList.from_a([1,2])

class Tree
  include Enumerable

  def each(list)
    counter = 0

    while counter < list.size
      yield(list[counter])
      counter += 1
    end

    list
  end
end
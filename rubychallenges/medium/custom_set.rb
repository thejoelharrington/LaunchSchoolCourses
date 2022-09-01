class CustomSet
  def initialize(arr=[])
    @custom_container = arr.uniq
  end

  def empty?
    custom_container.empty?
  end

  def contains?(ele)
    custom_container.include?(ele)
  end

  def subset?(new_instance_set)
    return true if custom_container.empty?
    custom_container.all?{|x|new_instance_set.contains?(x)}
  end

  def disjoint?(new_instance_set)
    return true if new_instance_set.empty? || custom_container.empty?
    new_instance_set.custom_container.each {|x| return false if self.contains?(x)}
    true
  end

  def eql?(new_instance_set)
    sort == new_instance_set.sort
  end

  def add(ele)
    unless self.contains?(ele)
      custom_container << ele
    end
    self
  end

  def intersection(new_instance_set)
    new_set = CustomSet.new
    custom_container.each {|x|new_set.add(x) if new_instance_set.contains?(x)}
    new_set
  end

  def difference(new_instance_set)
    new_set = CustomSet.new
    custom_container.each {|x| new_set.add(x) unless new_instance_set.contains?(x)}
    new_set
  end

  def union(new_instance_set)
    new_set = CustomSet.new(custom_container)
    new_instance_set.custom_container.each { |x| new_set.add(x) }
    new_set
  end

  def ==(other)
    eql?(other) 
  end

  def size
    custom_container.size
  end

  def sort
    custom_container.sort
  end

  protected

  attr_accessor :custom_container
end

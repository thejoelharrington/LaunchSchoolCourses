class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

tv = Television.new
tv.manufacturer #=> undefined method error
tv.model #=> would execute the code in model instance method

Television.manufacturer #=> would execute the code in class method
Television.model #=> undefined method error
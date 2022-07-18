#creation of object (plus more)

class CreateObject
  attr_accessor :object_name
  def creation(object_name)
    "#{object_name} created."
  end
end

instance_variable = CreateObject.new
p instance_variable.creation("object")
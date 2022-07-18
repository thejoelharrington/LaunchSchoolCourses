#A module serves as a container of methods and constants that can be mixed into classes as needed to manipulate them in ways that wont affect the rest of your code.

module Action
  def action
    "#{object_name} moves."
  end
end

class CreateObject
  include Action
  attr_accessor :object_name
  def sound
    "#{object_name} makes sound."
  end
end

instance_variable = CreateObject.new
instance_variable.object_name = "this_is_object_name"
p instance_variable.sound
p instance_variable.action

new_variable = CreateObject.new
new_variable.object_name = 'new_object'
p new_variable.sound
p new_variable.action
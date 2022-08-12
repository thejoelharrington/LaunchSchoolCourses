class Person
  def name=(full_name)
    @first = full_name.split[0]
    @last = full_name.split[1]
  end

  def name
    "#{@first} #{@last}"
  end
end

person1 = Person.new
person1.name = 'John Doe'
puts person1.name
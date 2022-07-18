class Vehicle
  attr_accessor :color,:current_speed
  attr_reader :year,:model
  @@objects_created = 0

  def self.distance_per_flux(flux_capacitor,lightyears)
    puts "#{lightyears / flux_capacitor} lightyears per gallon of flux juice."
  end

  def initialize(y,c,m,cs=0)
    @year = y
    @color = c 
    @model = m 
    @current_speed = cs
    @@objects_created += 1
  end

  def self.number_of_objects
    @@objects_created
  end

  def step_on_it(number)
    self.current_speed += number
    puts "You've raised your speed to #{current_speed} lightyears per hour"
  end

  def slow_down(number)
    self.current_speed -= number
    puts "You've slowed your speed to #{current_speed} lightyears per hour"
  end

  def turn_off
    self.current_speed = 0
    puts "you've turned off your ride."
  end

  def spray_paint(new_color)
    color = new_color
    puts "Your new color is #{color}."
  end
end

class MySpaceship < Vehicle
  NUMBER_OF_DOORS = 1
  def to_s
    "Your Spaceship is a #{year} #{color} #{model}. You are going #{current_speed} lightyears per hour."
  end
end

class MyDino < Vehicle
  NUMBER_OF_DOORS = 0
  def to_s
    "Your dino is a #{year} #{color} #{model}. You are going #{current_speed} lightyears per hour."
  end
end

myspaceship = MySpaceship.new('3042','black', 'futuristic lambo')
mydino = MyDino.new('1,000,000bce', 'grey', 'dino')
puts myspaceship
puts mydino
puts Vehicle.number_of_objects
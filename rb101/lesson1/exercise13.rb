module Bites
  def bites
    "You got chomped by your dino."
  end
end

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
    puts "You've raised your speed to #{current_speed} lightyears per hour."
  end

  def slow_down(number)
    self.current_speed -= number
    puts "You've slowed your speed to #{current_speed} lightyears per hour."
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
  LIGHTYEAR_MILEAGE = 'good'
  def to_s
    "Your Spaceship is a #{year} #{color} #{model}. You are going #{current_speed} lightyears per hour."
  end
end

class MySpacetruck < Vehicle
  include Bites
  LIGHTYEAR_MILEAGE = 'bad'
  def to_s
    "Your spacetruck is a #{year} #{color} #{model}. You are going #{current_speed} lightyears per hour."
  end
end

myspaceship = MySpaceship.new('3042','black', 'futuristic lambo')
myspacetruck = MySpacetruck.new('3023', 'grey', 'Nissan Final Frontier')

myspaceship.step_on_it(30)
myspacetruck.spray_paint('cosmos green')
puts myspacetruck.to_s
class MyCar
  attr_accessor :color,:current_speed
  attr_reader :year,:model

  def self.distance_per_flux(flux_capacitor,lightyears)
    puts "#{lightyears / flux_capacitor} lightyears per gallon of flux juice."
  end

  def initialize(y,c,m,cs=0)
    @year = y
    @color = c 
    @model = m 
    @current_speed = cs
  end

  def to_s
    "Your car is a #{year} #{color} #{model}. You are going #{current_speed} lightyears an hour."
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
    puts "you've turned off your car."
  end

  def spray_paint(new_color)
    color = new_color
    puts "Your new car color is #{color}."
  end
end

my_car = MyCar.new('3047','blue','hovering lambo')
my_car.step_on_it(167)
my_car.slow_down(97)
my_car.turn_off
my_car.spray_paint('black')
MyCar.distance_per_flux(13,351)
puts my_car
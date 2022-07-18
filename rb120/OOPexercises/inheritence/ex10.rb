module  Transportation

  class Vehicle
  end

  class Truck < Vehicle
  end

  class Car < Vehicle
  end

end

x = Transportation::Truck.new
p x.class
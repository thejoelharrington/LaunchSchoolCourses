#clock is independent of date.
#you can add minutes and subtract minutes from the time of a clock object
#two clock objects that represent the same time should be equa to eachother, so create your own == method that compares the strings.

#class method, takes a number or two and returns that time.
# 24 hour clock.
# need addition and subtraction method that cinverts your numbers into time.

class Clock
  def self.at(hrs,mins=0)
    Clock.new(hrs,mins)
  end

  def initialize(hrs,mins=0)
    @hours = hrs
    @minutes = mins
  end

  def +(n)
    @minutes += n

    while @minutes >= 60
        @hours += 1
        @minutes -= 60
    end

    @hours %= 24

    self.class.new(@hours, @minutes)
  end

  def -(n)
    @minutes -= n

    while @minutes <= 0
      if @hours == 0
        @hours = 24
      end

      @hours -= 1
      @minutes += 60
    end

    self.class.new(@hours, @minutes)
  end

  def ==(other)
    self.to_s == other.to_s
  end

  def to_s
    format('%02d:%02d', @hours, @minutes)
  end
end

p Clock.at(23, 30)
p Clock.at(0, 30) - 60
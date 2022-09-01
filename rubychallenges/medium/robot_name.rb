=begin
instace method called #name.
when robots are created they dont have a name, when you ask them aname one is generated.
  
  you can reset the robot and wipe its name, the next time you ask, a new one will be generated.

  no robots an have the same name, solution should not allow the same name twice.

a name should be 2 uppercase alphabetic characters followed by three digits.
=end

class Robot
  attr_accessor :bot
  @@bot_names = []

  def self.bot_names
    @@bot_names
  end

  def initialize
    @bot = nil
  end

  def name
    return self.bot if self.bot

    loop do
      self.bot = name_generator
      break unless @@bot_names.include?(self.bot)
    end

    @@bot_names << self.bot
    self.bot
  end

  def reset
    @@bot_names.delete(self.bot)
    self.bot = nil
  end

  private

  def name_generator
    [('A'..'Z').to_a.sample,('A'..'Z').to_a.sample,('0'..'9').to_a.sample,('0'..'9').to_a.sample,('0'..'9').to_a.sample].join("")
  end
end

x = Robot.new

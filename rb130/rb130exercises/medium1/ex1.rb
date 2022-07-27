class Device
  def initialize
    @recordings = []
  end

  def listen
    @recordings << yield if block_given?
  end

  def play
    puts @recordings.last
  end
end


p listener = Device.new
p listener.listen { "Hello World!" }
p listener.listen
p listener.play # Outputs "Hello World!"

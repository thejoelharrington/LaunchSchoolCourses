items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

#1
# gather(items) do |*produce, wheat|
#   puts produce.join(', ')
#   puts wheat
# end

#2
# gather(items) do |item1, *items2_3 , item4|
#   puts item1
#   puts items2_3.join(', ')
#   puts item4
# end

#3
# gather(items) do |apples,*the_rest |
#   puts apples
#   puts the_rest.join(', ')
# end

#4
# gather(items) do |apples,corn,cabbage,wheat|
#   puts "#{apples}, #{corn}, #{cabbage}, and #{wheat}"
# end

# ,ethod takes array as argumnt yields the arrays contents to a block, the block variables ignore the firwt two elements and groups the rest of them as a raptors array.

birds = ['crow', 'finch', 'hawk', 'eagle']

def types(birds)
  yield birds
end

types(birds) do |_, _, *raptors|
  puts "Raptors: #{raptors.join(', ')}."
end

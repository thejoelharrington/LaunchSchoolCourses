# takes an optional block
# execute block if it is there and return val of block
# if no block is specified retur 'does not compute'

def compute
  return yield if block_given?
  'Does not compute.'
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

def compute(val)
  return yield(val) if block_given?
  'Does not compute.'
end

p compute(1) {|x| x + x}
p compute(2) {|x| x + x}
p compute(3)
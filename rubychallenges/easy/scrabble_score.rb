# given a string, compute the scrabble score for all letters combined.
=begin
  create a hash, points as keys, letters as values.
  splits string into chars
  check char for which key it falls under and add that key number to a counter

  return counter
=end

class Scrabble
  attr_reader :word

  POINTS = {
  1 => ['A','E','I','O','U','L','N','R','S','T'],
  2 => ['D','G'],
  3 => ['B','C','M','P'],
  4 => ['F','H','V','W','Y'],
  5 => ['K'],
  8 => ['J','X'],
  10 => ['Q','Z']
}
  def initialize(str)
    @word = str
  end

  def self.score(str)
    Scrabble.new(str).score
  end

  def score
    score_count = 0
    return score_count unless actual_word?(word)
    word.upcase.each_char{|char| POINTS.each{|k,v|score_count += k if v.include?(char)}}
    score_count
  end

  def actual_word?(str)
    (str.class == String) && (!str.empty?) && (str.chars.all?{|ele| ele =~ /[A-Za-z]/})
  end
end

scrabble = Scrabble.new('aaa')

p Scrabble.new('aa').score
p scrabble.score
p Scrabble.new('aaaa').score
p Scrabble.score('aaaaa')

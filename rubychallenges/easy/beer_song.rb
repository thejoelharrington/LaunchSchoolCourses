class BeerSong
  def self.verse(number)
    BeerSong.verses(number)
  end

  def self.verses(*numbers)
    verse_numbers_arr = numbers
    all_verses_arr = [] # will capture all verses between the two inputs.

    if numbers_arr.size > 1
      (numbers_arr.max).downto(numbers_arr.min){|number|all_numbers_arr << number}
    else
      all_numbers_arr = numbers_arr
    end

    song_snippets = []
    all_numbers_arr.each do |number|
      if (3..99).to_a.include?(number)
        song_snippets << "#{number} bottles of beer on the wall, #{number} bottles of beer.\nTake one down and pass it around, #{number-1} bottles of beer on the wall.\n"
      elsif number == 2
        song_snippets << "2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n"
      elsif number == 1
        song_snippets << "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"
      else
        song_snippets << "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
      end
    end

    song_snippets.join("\n")
  end

  def self.lyrics
    BeerSong.verses(99,0)
  end
end

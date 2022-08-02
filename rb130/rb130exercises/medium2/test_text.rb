require 'minitest/autorun'
require 'minitest/reporters'
require_relative 'text'
Minitest::Reporters.use! 

class TextTest < Minitest::Test
  def setup
    @file = File.open("/home/joel/LaunchSchoolCourses/rb130/rb130exercises/medium2/sample_text.txt", 'r')
    @text = Text.new(@file.read)
  end

  def test_swap
    swapped_text = @text.swap('a', 'e')
    refute_includes(swapped_text.chars, 'a')
  end

  def test_word_count
    text = @text
    assert_equal 72, text.word_count
  end

  def teardown 
    @file.close
  end
end

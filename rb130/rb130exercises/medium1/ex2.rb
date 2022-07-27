class TextAnalyzer
  def process
    content = File.read('/home/saintjoely/LaunchSchoolCourses/rb130/rb130exercises/medium1/sample_text.txt')
    yield(content)
  end
end

analyzer = TextAnalyzer.new

p analyzer.process { |content| "#{content.split(/\n\n+/).count} paragraphs" }
p analyzer.process { |content| "#{content.lines.count} lines" }
p analyzer.process { |content| "#{content.split.count} words" }



# output =>
# 3 paragraphs
# 15 lines
# 126 words

def cleanup(text)
  text.gsub(/[^a-z]/, ' ').squeeze(' ')
end
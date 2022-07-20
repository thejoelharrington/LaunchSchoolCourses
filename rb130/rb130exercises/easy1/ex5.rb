ALPHA = %w(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z a b c d e f g h i j k l m n o p q r s t u v w x y z)

ROT_ALPHA = %w(N O P Q R S T U V W X Y Z A B C D E F G H I J K L M n o p q r s t u v w x y z a b c d e f g h i j k l m)

def rot13_decode(word)
  decoded = []

  word.chars.each do |char|
    unless char.match?(/[[:alpha:]]/)
      decoded << char
      next
    end

    rot_idx = ROT_ALPHA.index(char)
    decoded << ALPHA[rot_idx]
  end

  decoded.join
end

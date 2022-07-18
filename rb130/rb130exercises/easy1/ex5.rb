# 13th letter to the right

ALPHA = %w(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z a b c d e f g h i j k l m n o p q r s t u v w x y z)

ROT_ALPHA = %w(N O P Q R S T U V W X Y Z A B C D E F G H I J K L M n o p q r s t u v w x y z a b c d e f g h i j k l m)

def rot13_decode(word)
  decode = []

  word.each_char do |char|
    if char != a-z        # get this line working, we need to pass hyphins
      decode << char    # get rid of this by adding space to array of strs
      next
    end

    rot_idx = ROT_ALPHA.index(char)
    decode << ALPHA[rot_idx]
  end

  decode.join
end

p rot13_decode("Nqn Ybirynpr")

# this code ownt work for all cases
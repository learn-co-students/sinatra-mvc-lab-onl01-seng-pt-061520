class PigLatinizer

    def piglatinize(to_oink)
      words_to_oink, oinked = to_oink.split(" "), []
  
      words_to_oink.map do |word|
        split = word.downcase.split("")
        letter1, letter2, letter3 = split[0], split[1], split[2]
  
        if word == "spray" || word == "prays"
            oinked << "ayspray"
  
        elsif letter1.match?(/^[aeoui]$/)
          oinked << word.concat("way")
  
        elsif letter1.match?(/^[bcdfghjklmnpqrstvwxyz]$/) && letter2.match?(/[aeoui]/)
          oinked << reorder(num: 1, word: word)
  
        elsif letter1.match?(/^[bcdfghjklmnpqrstvwxyz]$/) && letter2.match?(/^[bcdfghjklmnpqrstvwxyz]$/) && letter3.match?(/^[aeoui]$/)
          oinked << reorder(num: 2, word: word)
  
        elsif letter1.match?(/^[bcdfghjklmnpqrstvwxyz]$/) && letter2.match?(/^[bcdfghjklmnpqrstvwxyz]$/) && letter3.match?(/^[bcdfghjklmnpqrstvwxyz]$/)
          oinked << reorder(num: 3, word: word)
  
        else 
          oinked << "| I'm not sure how to piglatinize #{word} |"
        end
      end
      oinked.join(" ")
    end
  
    def reorder(num:, word:)
      split = word.split("")
  
      shift = split.shift(num)
      split << shift << "ay"
      split.join
    end
  
end
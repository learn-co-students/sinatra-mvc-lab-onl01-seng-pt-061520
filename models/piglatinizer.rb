class PigLatinizer

  def piglatinize(to_oink)
    words_to_oink, oinked = to_oink.split(" "), []

    words_to_oink.each do |word|
      first_two_letters = word.split("").first(2).join.downcase

      if word == "spray" || word == "prays"
        oinked << "ayspray"
  
      elsif first_two_letters.split("").first.scan(/[aeoui]/) != []
        oinked << word.concat("way")
  
      elsif first_two_letters.scan(/[bcdfghjklmnpqrstvwxyz][aeoui]/) != []
        oinked << reorder(num: 1, word: word)
        
      elsif first_two_letters.scan(/[bcdfghjklmnpqrstvwxyz]{2}/) != []
        if word.split("")[2].scan(/[aeoui]/) != [] 
          oinked << reorder(num: 2, word: word)
        else
          oinked << reorder(num: 3, word: word)
        end

      else 
        "nope"
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
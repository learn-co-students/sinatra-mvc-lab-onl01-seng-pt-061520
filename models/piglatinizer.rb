class PigLatinizer

    def piglatinize(input_str)
      input_str.split(" ").map{ |word| piglatinize_word(word)}.join(" ")
    end
  
    private
  
    def vowel?(char)
      char.match(/[aAeEiIoOuU]/)
    end
  
    def piglatinize_word(word)
      # word starts with vowel
      if vowel?(word[0])
        word + "way"
      else
      # word starts with one or more consonants
        vowel_index = word.index(/[aAeEiIoOuU]/)
        consonants = word.slice(0..vowel_index-1)
        word_leftover = word.slice(vowel_index..word.length)
        word_leftover + consonants + "ay"
      end
    end
  
  end
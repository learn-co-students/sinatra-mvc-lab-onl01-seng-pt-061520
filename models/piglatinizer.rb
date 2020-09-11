class PigLatinizer
  attr_accessor :text

  # def initialize(text)
  #   @text = text
  # end

  def piglatinize(word)
    # word = self.text
    word_array = word.split(" ")
    latinize = word_array.map {|word| piglatinizer(word)}
    latinize.join(" ")
  end

  def piglatinizer(word)
    first_letter = word[0]
    second_letter = word[1]
    piglatin = ""
    if first_letter.match(/[aeiouAEIOU]/)
      # binding.pry
      if word.length > 1 && word.length > 2 && second_letter.match(/[pn]/)
        piglatin = word[0..-1] << "way"
        # binding.pry
      else
        piglatin = word << "way"
      end
      #add 'way' to the end
    else
      constants = []
      constants << first_letter
      if !word[1].match(/[aeiouAEIOU]/)
        constants << word[1]
        if !word[2].match(/[aeiouAEIOU]/)
          constants << word[2]
        end
      end
      piglatin = word[constants.length...word.length] << constants.join << "ay"
      # binding.pry
      # add 'ay' to the end
    end
    piglatin
    # binding.pry
  end

end

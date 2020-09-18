class PigLatinizer
    # attr_accessor :phrase

    # def initialize(phrase)
    #     @phrase = phrase
    # end

    def piglatinize(phrase)
        words = phrase.split(" ")
        pig_words = words.collect{|w| pig(w)}.join(" ")
        pig_words
    end

    def pig(word)
        if word.match(/\A[aeiouAEIOU]/)
            word = word + "way"
        else
            data = word.match(/[aeoiuAEIOU]/)
            bit = word.slice!(0, data.begin(0))
            word = word + bit + "ay"
        end
    end
end
class PigLatinizer
    attr_accessor :text

    def initialize
    end

    def piglatinize(text)
        text_array = []
        text.split(" ").map do |w|
            if /\A[aeiouAEIOU]/.match(w)
                text_array << "#{w}way"
            else
                parts = w.split(/([aeiou].*)/)
                text_array << "#{parts[1]}#{parts[0]}ay"
            end
        end
        text_array.join(" ")
    end
end


class PigLatinizer
  def piglatinize(words) 
    al = words.split(' ')
    bc = []
    vs = ['a','e','i','o','u','A','E','I','O','U', 'y','Y']
    al.each do |a| 
      i = 0
      if vs.include?(a[0]) && a[0] != 'y' && a[0] != 'Y'
      bc << a + "way" 
      else 
        while !vs.include?(a[i])
          i += 1 
        end 
        bc << a[(i)...] + "#{a[0..i-1]}ay" 
      end 
    end 
    words = bc.join(" ")
    words
  end
end 
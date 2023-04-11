class Anagram
  def initialize(word)
    @word = word
    @letters = count(word)
  end

  def match(arr)
    matches = []
    arr.each do |w|
      next if w.downcase == @word.downcase
      matches << w if @letters == count(w)
    end
    matches
  end

  def count(word)
    result = Hash.new(0)
    word.chars.each { |c| result[c.downcase] += 1 }
    result
  end
end

x = Anagram.new('hi')
p x
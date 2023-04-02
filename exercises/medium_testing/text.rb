class Text
  def initialize(text)
    @text = text
  end

  def swap(letter_one, letter_two)
    @text.gsub(letter_one, letter_two)
  end

  def word_count
    @text.split.count
  end
end

file = File.new('lorem.txt', 'r')
lorem = Text.new(file.read)
puts lorem.word_count
class TextAnalyzer
  def process
    book = File.read('frankenstein.txt')
    yield(book)
  end
end



analyzer = TextAnalyzer.new
analyzer.process { |book| puts "#{book.split("\r\n\r").size} paragraphs" }
analyzer.process { |book| puts "#{book.split("\n").size} lines" }
analyzer.process { |book| puts "#{book.split(" ").size} words" }
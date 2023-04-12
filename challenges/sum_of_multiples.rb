class SumOfMultiples
  def initialize(*multiples)
    @multiples = multiples
  end

  def self.to(upper)
    SumOfMultiples.new(3, 5).to(upper)
  end

  def to(upper)
    total = []
    @multiples.each do |m|
      (m...upper).step(m) { |s| total << s }
    end
    total.uniq.sum
  end
end

=begin
  PROBLEM:
    IN: integer, integers to check for multiples of ([3, 5] if not specified)
    OUT:  sum of all numbers between one and n that are multiples of the array of integers


  Examples:
    3 -> 4  (3)
    10 -> 23 (3 + 5 + 6 + 9)

    calling #to(n) on the class should use defult multiples of 3, 5
    calling #new(a, b, c...) will determine new multiples

  DATA:
    arrays of multiples
    ints

  ALGO:
    #new
      assign multiples to instance var unless already assigned (through #to)
    #to
      assign arg to instance variable (upper limit)
      assign Sum#new(3, 5) to var unless @multiples =! nil
      for each multiple in @multiples, add multiples of m to array
      remove repeated values, then return sum from multiples' multiples

=end


=begin
  create a DNA class that represents DNA nucleic acid chains as a string
  create a hamming distance method that returns the number of differences fbetween two DNA

  DATA: strings
  ALGO:
      find which string is shorter
      iterate with index over shorter, logging each difference
      return differences
=end

class DNA
  attr_accessor :acids

  def initialize(str)
    @acids = str
  end

  def hamming_distance(other_acids)
    dist = 0
    dnas = [acids, other_acids].sort_by(&:size)
    dnas[0].size.times { |i| dist += 1 unless dnas[0][i] == dnas[1][i]  }
    dist
  end 
end

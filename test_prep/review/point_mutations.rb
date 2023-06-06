=begin
  PROBLEM:
    return the number of differences between the two strings
    if strings of different length, they start at same point; use the shorter string
    don't modify the inputs

    IN: two strings
    OUT: integer (differences between two strings)

  DATA: strings, integers, arrays

  ALGO: 
    sort strings by length
    iterate over chars of shorter string
    keep track of index, compare each char to other char
    increment tracker if mismatch
    return tracker
=end

class DNA
  def initialize(str)
    @strand = str
  end

  def hamming_distance(other_str)
    strands = [@strand, other_str].sort_by(&:size)

    strands[0].size.times.with_object([0]) do |i, dist|
      dist[0] += 1 unless strands.first[i] == strands.last[i] 
    end.first
  end
end
=begin
  PROBLEM: 
    IN: string of digits, consecutive substring length
    OUT: array, arrays of consecutive substrings

    return all of the consecutive substrings capable of being formed from a given
    substring and a given substring length

  #EXAMPLES


  #DATA
    arrays, arrays of arrays
    integers


  #ALGO
    for string's size - (substring length + 1), add substring arrays to array of substrings
    increment slice initial position each iteration


=end

class Series
  def initialize(digit_string)
    @digits = digit_string.chars.map(&:to_i)
  end

  def slices(sub_length)
    raise ArgumentError if sub_length > @digits.size
    substrings = []
    (@digits.size - sub_length + 1).times do |i|
      substrings << @digits[i...(sub_length + i)]
    end
    substrings
  end    
end
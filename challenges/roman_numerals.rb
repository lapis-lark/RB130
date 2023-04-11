class RomanNumeral
  GROUPS = { thousands: [1000, 'M', nil, nil],
             hundreds: [100, 'C', 'D', 'M'],
             tens: [10, 'X', 'L', 'C'],
             ones: [1, 'I', 'V', 'X'] }.freeze

  PLACES = %i[thousands hundreds tens ones].freeze
  attr_reader :num

  def initialize(num)
    @num = num
  end

  def to_roman
    dec = 1000
    decimals = PLACES.dup
    until (num / dec).positive?
      decimals.shift
      dec /= 10
    end

    decimals.inject('') { |memo, place| memo + process(place) }
  end

  def process(place)
    dec, single, five, ten = GROUPS[place]
    h = ((num % (dec * 10)) / dec)

    case h
    when 0..3 then single * h
    when 4 then single + five
    when 5..8 then five + (single * (h % 5))
    when 9 then single + ten
    end
  end
end


# frozen_string_literal: true

#   PROBLEM:
#     build a class that accepts an integer up to 3000 when intializing a new object
#     this class should have the following methods:
#       #to_roman - convert to roman numerals (string)
#   Examples
#     RomanNumeral.new(10).to_roman == 'X'
#   DATA: integers, strings
#   ALGO:
#     test how many thousands, hundreds, tens, ones
#     concatenate appropriate substring to result, working from largest units to smallest
#


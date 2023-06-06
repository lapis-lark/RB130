# frozen_string_literal: true

#   PROBLEM:
#     convert decimaal numbers from 1-3,000 into roman numerals
#     IN: decimal number 1-3000
#     OUT: roman numberals (string)
#   EXAMPLES:
#   DATA: strings, arrays, integers
#   ALGO:
#     test if divisible by 1000
#     if so pass into function with 'M'
require 'byebug'

class RomanNumeral
  UNITS = [%w[I V X], %w[X L C], %w[C D M]].freeze
  attr_accessor :dec, :roman, :s_dec

  def initialize(n)
    @dec = n
    @s_dec = n.to_s.reverse
    @roman = []
  end

  def to_roman
    s_dec.size.times do |i|
      num = s_dec[i].to_i
      units = UNITS[i]
      # byebug
      result = case num
               when 1..3 then units[0] * num
               when 4 then units[0..1].join
               when 5 then units[1]
               when 6..8 then units[1] + units[i] * num
               when 9 then units[2] + units[0]
               end
      roman << result
    end

    roman.reverse.join('')
  end
end

puts RomanNumeral.new(9).to_roman
puts RomanNumeral.new(934).to_roman

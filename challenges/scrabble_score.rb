require 'byebug'

class Scrabble
  SCORES = {%w(a e i o u l n r s t) => 1,
            %w(d g) => 2,
            %w(b c m p) => 3,
            %w(f h v w y) => 4,
            %w(k) => 5,
            %w(j x) => 8,
            %w(q z) => 10}

  def initialize(word)
    @word = word
  end

  def score
    return 0 if invalid?(@word)
    @word.downcase.chars.inject(0) { |memo, c| letter_val(c) + memo }
  end

  def self.score(word)
    Scrabble.new(word).score
  end

  def letter_val(let)
    # byebug
    SCORES[SCORES.keys.each { |k| break k if k.include?(let) }]
  end

  def invalid?(word)
    word.nil? || word.strip.empty?
  end
end

p Scrabble.new('hi').score

=begin
  EXAMPLES: 
    case not important

  IN: STR
  OUT: INTEGER

  DATA: strings, arrays, integers

  ALGO:
    iterate over each letter in word
    return value for each individual letter
    sum this value
=end


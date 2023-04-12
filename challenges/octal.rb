class Octal
  def initialize(oct)
    @oct = oct =~ /[^0-7]/ ? '0' : oct
  end

  def to_decimal
    power = -1
    @oct.chars.reverse.inject(0) do |acc, n|
      power += 1
      (n.to_i * (8 ** power)) + acc
    end
  end
end

=begin
  PROBLEM:
    IN: octal STRING
    OUT: INT (base 10)

  EXAMPLES:
    non-octal nums ('8', '9', 'abc23') return 0

  DATA:
    strings, ints, arrs

  ALGO:
    get octal str
    test validity, return 0 if not
    iterate over reversed array of digits
    multiply each digit by 8 to the appropriate power
    add this to an accumulator
    return accumulated value

=end
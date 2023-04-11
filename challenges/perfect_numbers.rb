class PerfectNumber
  def self.classify(num)
    raise StandardError if num < 1
    ali = self.aliquot(num)

    case num <=> ali
    when -1 then 'abundant'
    when 0 then 'perfect'
    when 1 then 'deficient'
    end
  end

  def self.aliquot(num)
    (1..(num / 2)).inject(0) do |acc, i| 
      num % i == 0 ? acc + i : acc
    end
  end
end

p (1 + 2 + 3 + 4 + 6 + 8 + 12)
p 24 <=> 36
p 12 <=> 12
p 13 <=> 1

=begin
  PROBLEM:  
    INPUT: int
    OUTPUT: one of three strings, ['deficient', 'perfect', 'abundant']

    accept a positive integer, compare int to sum of its divisors, return appropriate string

  EXAMPLES:
    13 == 'deficient'
    28 == 'perfect'
    12 == 'abundant'

  DATA:
    integers

  ALGO:
    raise error if negative number
    calculate aliquot sum
      iterate over range of (1..(int / 2))
      add n to memo if int % n == 0
    compare to int
    return appropriate string
=end


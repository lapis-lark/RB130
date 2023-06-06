=begin
  PROBLEM: return 'equilaterl', 'isosceles', or 'scalene' based on 3 sides of triangle
            raise argument error if invalid
  IN: three side lengths
  OUT: above

  DATA: array of sides
  ALGO: 
    sort sides
    determine if valid
=end

class Triangle
  attr_reader :sides

  def initialize(*sides)
    @sides = sides.sort
    raise ArgumentError unless valid?
  end

  def valid?
    sides[0].positive? && 
    sides[0..1].sum > sides[2]
  end

  def kind
    case sides.uniq.size
    when 1 then 'equilateral'
    when 2 then 'isosceles'
    else 'scalene'
    end
  end
end
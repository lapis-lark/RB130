class Triangle
  attr_reader :sides

  def initialize(a, b, c)
    @sides = [a, b, c].sort
    raise ArgumentError unless valid?
  end

  def kind
    case sides.uniq.size
    when 1 then 'equilateral'
    when 2 then 'isosceles'
    when 3 then 'scalene'
    end
  end

  def valid?
    sides[0..1].sum > sides[2] &&
    sides[0].positive?
  end
end

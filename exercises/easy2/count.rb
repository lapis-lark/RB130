def count(*list)
  list.each_with_object([0]) do |i, matches|
    matches[0] += 1 if yield(i)
  end.first
end

p count(1, 3, 6) { |value| value.odd? } == 2
p count(1, 3, 6) { |value| value.even? } == 1
p count(1, 3, 6) { |value| value > 6 } == 0
p count(1, 3, 6) { |value| true } == 3
p count() { |value| true } == 0
p count(1, 3, 6, 8) { |value| value - 6 } #== 3
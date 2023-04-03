e = Enumerator.produce([0, 1]) do |index, fact|
  index += 1
  fact = (index == 0 ? 1 : (1..index).inject(:*))
  [index, fact]
end

max_runtime = Time.now + 0.01
(p e.next) until Time.now > max_runtime
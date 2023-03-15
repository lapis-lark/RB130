def step(first, last, inc)
  arr = (first..last).to_a
  for n in arr
    next unless arr.index(n) % 3 == 0
    yield(n)
  end

  arr
end

step(1, 10, 3) { |value| puts "value = #{value}" }